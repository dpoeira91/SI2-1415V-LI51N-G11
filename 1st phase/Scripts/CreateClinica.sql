use clinica
/*
 * Tabela que representa a entidade Pessoa
*/
CREATE TABLE Pessoa
(
	Bi INT NOT NULL,
	Nif INT NOT NULL UNIQUE,
	NumeroSS INT NOT NULL UNIQUE,
	Nome nvarchar(1000) NOT NULL,
	UltimoNome nvarchar(250) NOT NULL,
	DataNascimento date NOT NULL,
	Nacionalidade nvarchar(300),
	EMail nvarchar(250),
	PRIMARY KEY(Bi)
)

/*
* Tabela que representa a entidade TipoContacto
*/
create table TipoContacto
(
	Tipo int PRIMARY KEY,
	Descricao nvarchar(250) NOT NULL UNIQUE
)


/*
 * Tabela que representa a entidade Morada
*/
create table Morada
(
	Pessoa int references Pessoa(Bi),
	Ordem smallint,
	Rua nvarchar(1000) NOT NULL,
	Numero nvarchar(9) NOT NULL,
	CodigoPostal nvarchar(8) NOT NULL,
	Cidade nvarchar(300) NOT NULL,
	Pais nvarchar(300) NOT NULL,
	Tipo int references TipoContacto(Tipo) NOT NULL,
	PRIMARY KEY(Pessoa,Ordem)
)

/*
 * Tabela que representa a entidade Telefone
*/
create table Telefone
(
	Pessoa int references Pessoa(Bi),
	Ordem int,
	Numero nvarchar(15) NOT NULL,
	Tipo int NOT NULL,
	FOREIGN KEY (Tipo) references TipoContacto(Tipo),
	PRIMARY KEY(Pessoa, Ordem)
)

/*
 * Tabela que representa a entidade Paciente
*/
create table Paciente
(
	Pessoa int references Pessoa(Bi) NOT NULL UNIQUE,
	NumeroBenefeciario int NOT NULL,
	SistemaSaude nvarchar(200) NOT NULL,
	bonus int NOT NULL default 0 CHECK(bonus >=0),
	temDesconto BIT NOT NULL default 0
	PRIMARY KEY(NumeroBenefeciario),
)

/*
 * Tabela que representa a entidade Especialidade
*/
create table Especialidade
(
	IdEspecialidade int PRIMARY KEY IDENTITY(1,1),
	Nome nvarchar(300) NOT NULL UNIQUE,
	Preco decimal(10,2) NOT NULL
)

/*
 * Tabela que representa a entidade Medico
*/
create table Medico
(
	Pessoa int references Pessoa(Bi) UNIQUE NOT NULL,
	LicencaMedica int NOT NULL,
	DataLicenca date NOT NULL,
	NumeroPacientesDiario int NOT NULL,
	NumeroListadeEspera int NOT NULL,
	PRIMARY KEY (LicencaMedica)
)

create table MedicoEspecialidade
(
	IdEspecialidade int references Especialidade(IdEspecialidade) NOT NULL,
	Licenca int references Medico(LicencaMedica) NOT NULL,
	PRIMARY KEY(Licenca, IdEspecialidade)
)

create table MotivoConsulta
(
	Motivo nvarchar(30) NOT NULL PRIMARY KEY
)


/*
 * Tabela que representa a entidade Consulta
*/
create table Consulta 
(
	IdConsulta int PRIMARY KEY IDENTITY(1,1),
	Motivo nvarchar(30) NOT NULL references MotivoConsulta(Motivo),
	Data date NOT NULL,
	DataRegisto datetime NOT NULL DEFAULT GETDATE(),
	PacienteConsulta int NOT NULL,
	MedicoConsulta int NOT NULL,
	EspecialidadeConsulta int NOT NULL,
	FOREIGN KEY (PacienteConsulta) references Paciente(NumeroBenefeciario),
	FOREIGN KEY (MedicoConsulta, EspecialidadeConsulta) references MedicoEspecialidade(Licenca, IdEspecialidade)-- GARANTE 1.
)


/*
 * Tabela que representa a entidade Especialidade
*/
create table Medicamento
(
	IdMedicamento int PRIMARY KEY IDENTITY(1,1),
	PrincipioActivo nvarchar(300) NOT NULL,
	NomeComercial nvarchar(300) NOT NULL,
	Laboratorio nvarchar(300) NOT NULL,
	Dose decimal(4,2) NOT NULL
)

create table Posologia
(
	Posologia nvarchar(20) NOT NULL PRIMARY KEY
)

/*
 * Tabela que representa a entidade MedicamentoPaciente
*/
create table MedicamentoPaciente
(
	IdMedicamento int references Medicamento(IdMedicamento) NOT NULL,
	IdPaciente int references Paciente(Pessoa) NOT NULL,
	Posologia nvarchar(20) NOT NULL references Posologia(Posologia), 
	PRIMARY KEY (IdMedicamento, IdPaciente)
)


create table EstadoFatura
(
	estado nvarchar(10) NOT NULL PRIMARY KEY
)

/*
 * Tabela que representa a entidade Fatura
*/
create table Fatura
(
	IdFatura int NOT NULL IDENTITY(1,1),
	Ano int NOT NULL,
	Data datetime NOT NULL,
	Morada nvarchar(2000) NOT NULL,
	Nome nvarchar (1250) NOT NULL,
	Nif int NOT NULL,
	Montante decimal(10,2) NOT NULL DEFAULT 40.0,
	Estado nvarchar(10) NOT NULL references EstadoFatura(estado),
	PRIMARY KEY (IdFatura)
)

/*
 * Tabela que representa a entidade Relatorio
*/
create table Relatorio
(
	IdRelatorio int PRIMARY KEY IDENTITY(1,1),
	Data datetime NOT NULL,
	Descricao nvarchar(2000) NOT NULL,
)

/*
 * Tabela que representa a entidade ItemFatura
*/
create table ItemFatura
(
	Numero int NOT NULL,
	IdFatura int references Fatura(IdFatura),
	Descricao nvarchar(1000) NOT NULL,
	Montante decimal(10,2) NOT NULL,
	PRIMARY KEY (IdFatura, Numero)
)

create table ItemFaturaRelatorio
(
	Numero int NOT NULL,
	IdFatura int NOT NULL,
	IdRelatorio int references Relatorio(IdRelatorio) NOT NULL UNIQUE,
	FOREIGN KEY (IdFatura, Numero) references ItemFatura(IdFatura, Numero),
	PRIMARY KEY (Numero, IdFatura)
)

/*
* Tabela que representa a entidade RelatorioMedico
*/
create table RelatorioMedico
(
	IdRelatorio int references Relatorio(IdRelatorio),
	EstadoClinico nvarchar(2000) NOT NULL,
	Prescricoes nvarchar(2000),
	PRIMARY KEY (IdRelatorio)
)

/*
 * Tabela que representa a entidade TipoExame
*/
create table TipoExame
(
	IdTipoExame int PRIMARY KEY NOT NULL IDENTITY(1,1),
	Nome nvarchar(500) NOT NULL,
	Preco decimal(10,2) NOT NULL
)

/*
 * Tabela que representa a entidade RelatorioMedico
*/
create table RelatorioExame
(
	IdRelatorio int references Relatorio(IdRelatorio),
	IdEquipamento int,
	Notas nvarchar(2000),
	Resultado xml/*(examesMedicosXSD)*/ NOT NULL,
	Tipo int references TipoExame(IdTipoExame) NOT NULL,
	PRIMARY KEY (IdRelatorio)
)

/*
 * Tabela que representa a entidade RelatorioMensalFinanceiroc
*/
create table RelatorioMensalFinanceiro
(
	Ano int NOT NULL,
	Mes int NOT NULL,
	Relatorio xml NOT NULL,
	PRIMARY KEY (Ano, Mes)
)

--drop XML SCHEMA COLLECTION examesMedicosXSD 
/*CREATE XML SCHEMA COLLECTION examesMedicosXSD AS
'<!-- Definir aqui o schema do espaço de nomes http://generalelectricts.org/schema/eco/1999 -->
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
</xs:schema>


<!-- Definir aqui o schema do espaço de nomes http:/agfa.com/imaging/2010/cardio -->
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
</xs:schema>

<xs:schema targetNamespace="http://internationmedicalequipment/normalization/2010"
    elementFormDefault="qualified"
    xmlns:ime="http://internationmedicalequipment/normalization/2010"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:agfa="http:/agfa.com/imaging/2010/cardio"
    xmlns:ge="http://generalelectricts.org/schema/eco/1999">
    
    <!-- Colocar tantos import quantos os schemas a importar
    <xs:import namespace="http://generalelectricts.org/schema/eco/1999"/>
    <xs:import namespace="http:/agfa.com/imaging/2010/cardio"/>
    
<xs:element name="MedicalExam" type="ime:MedicalExam"/>

<xs:complexType name="MedicalExam">
  <xs:sequence>
    <xs:element name="Norm" type="xs:boolean"/>
    <xs:element name="NormValidationCode" type="xs:string"/>
    <xs:choice>
      <!-- Descomentar quando implementar o schemas acima e eliminar o elemento dummy -->
      <xs:element name="dummy"/>
      <!--<xs:element ref="agfa:Report"/>-->
      <!--<xs:element ref="ge:Report"/>-->
    </xs:choice>
  </xs:sequence>
</xs:complexType>
</xs:schema>'
*/





