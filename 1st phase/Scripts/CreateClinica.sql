use clinica
/*
 * Tabela que representa a entidade Pessoa
*/
CREATE TABLE Pessoa
(
	Bi INT PRIMARY KEY,
	Nif INT NOT NULL UNIQUE,
	NumeroSS INT NOT NULL UNIQUE,
	Nome nvarchar(1000) NOT NULL,
	UltimoNome nvarchar(250) NOT NULL,
	DataNascimento date,
	Nacionalidade nvarchar(300),
	EMail nvarchar(250)
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
	Pessoa int,
	Ordem smallint,
	Rua nvarchar(1000) NOT NULL,
	Numero nvarchar(9) NOT NULL,
	CodigoPostal nvarchar(8) NOT NULL,
	Cidade nvarchar(300) NOT NULL,
	Pais nvarchar(300) NOT NULL,
	Tipo int NOT NULL,
	FOREIGN KEY (Tipo) references TipoContacto(Tipo),
	PRIMARY KEY(Pessoa, Ordem)
)

/*
 * Tabela que representa a entidade Telefone
*/
create table Telefone
(
	Pessoa int,
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
	Pessoa int NOT NULL,
	NumeroBenefeciario int,
	SistemaSaude nvarchar(200) NOT NULL,
	Bonus int NOT NULL,
	FOREIGN KEY (Pessoa) references Pessoa(Bi),
	PRIMARY KEY(NumeroBenefeciario),
	CHECK(Bonus > 0 AND Bonus <= 1000)
)


/*
 * Tabela que representa a entidade Especialidade
*/
create table Especialidade
(
	IdEspecialidade int PRIMARY KEY,
	Nome nvarchar(300) NOT NULL UNIQUE,
	Preco decimal(10,2) NOT NULL
)

/*
 * Tabela que representa a entidade Medico
*/
create table Medico
(
	Pessoa int NOT NULL,
	LicencaMedica nvarchar(20),
	DataLicenca date NOT NULL,
	NumeroPacientesDiario int,
	NumeroListadeEspera int,
	Especialidade int NOT NULL,
	FOREIGN KEY (Pessoa) references Pessoa(Bi),
	PRIMARY KEY(LicencaMedica, Especialidade) 
)

create table MotivoConsulta
(
	IdMotivo int PRIMARY KEY,
	Descricao nvarchar(100) NOT NULL UNIQUE
)

/*
 * Tabela que representa a entidade Consulta
*/
create table Consulta 
(
	IdConsulta int PRIMARY KEY,
	Motivo int NOT NULL,
	Data date NOT NULL,
	DataRegisto datetime,
	PacienteConsulta int NOT NULL,
	MedicoConsulta int NOT NULL,
	EspecialidadeConsulta int NOT NULL,
	FOREIGN KEY (Motivo) references MotivoConsulta(IdMotivo),
	FOREIGN KEY (PacienteConsulta) references Paciente(NumeroBenefeciario),
	FOREIGN KEY (MedicoConsulta) references Medico(LicencaMedica),
	FOREIGN KEY (EspecialidadeConsulta) references Especialidade(IdEspecialidade)
)


/*
 * Tabela que representa a entidade Especialidade
*/
create table Medicamento
(
	IdMedicamento int PRIMARY KEY,
	PrincipioActivo nvarchar(300) NOT NULL,
	NomeComercial nvarchar(300) NOT NULL,
	Laboratorio nvarchar(300) NOT NULL,
	Dose decimal(4,2) NOT NULL
)

/*
 * Tabela que representa a entidade Posologia
*/
create table Posologia
(
	IdPosologia int PRIMARY KEY,
	Descricao nvarchar(20) NOT NULL UNIQUE
)

/*
 * Tabela que representa a entidade MedicamentoPaciente
*/
create table MedicamentoPaciente
(
	IdMedicamento int,
	Paciente int ,
	Posologia int NOT NULL,
	FOREIGN KEY (Paciente) references Paciente(NumeroBenefeciario),
	FOREIGN KEY (Posologia) references Posologia(IdPosologia),
	PRIMARY KEY (IdMedicamento, Paciente)
)


/*
 * Tabela que representa a entidade Fatura
*/
create table Fatura
(
	IdFatura int PRIMARY KEY,
	Ano int NOT NULL,
	Data datetime NOT NULL,
	Morada nvarchar(2000) NOT NULL,
	Nome nvarchar (1250) NOT NULL,
	Nif int NOT NULL,
	Montante decimal(10,2) NOT NULL
)

/*
 * Tabela que representa a entidade Relatorio
*/
create table Relatorio
(
	IdRelatorio int PRIMARY KEY,
	Data datetime NOT NULL,
	Descricao nvarchar(2000) NOT NULL,
)

/*
 * Tabela que representa a entidade ItemFatura
*/
create table ItemFatura
(
	Numero int,
	IdFatura int,
	Descricao nvarchar(1000) NOT NULL,
	Montante decimal(10,2) NOT NULL,
	Relatorio int,
	FOREIGN KEY (IdFatura) references Fatura(IdFatura),
	FOREIGN KEY (Relatorio) references Relatorio(IdRelatorio),
	PRIMARY KEY (IdFatura, Numero)
)

/*
 * Tabela que representa a entidade RelatorioMedico
*/
create table RelatorioMedico
(
	IdRelatorio int PRIMARY KEY,
	EstadoClinico nvarchar(2000) NOT NULL,
	Prescricoes nvarchar(2000),
	FOREIGN KEY (IdRelatorio) references Relatorio(IdRelatorio)
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

/*
 * Tabela que representa a entidade TipoExame
*/
create table TipoExame
(
	IdTipoExame int PRIMARY KEY,
	Nome nvarchar(500) NOT NULL,
	Preco decimal(10,2) NOT NULL
)

/*
 * Tabela que representa a entidade RelatorioMedico
*/
create table RelatorioExame
(
	IdRelatorio int PRIMARY KEY,
	IdEquipamento int,
	Notas nvarchar(2000),
	Resultado xml/*(examesMedicosXSD)*/ NOT NULL,
	Tipo int NOT NULL,
	FOREIGN KEY (IdRelatorio) references Relatorio(IdRelatorio),
	FOREIGN KEY (Tipo) references TipoExame(IdTipoExame)
)

/*
 * Tabela que representa a entidade RelatorioMensalFinanceiroc
*/
create table RelatorioMensalFinanceiro
(
	Ano int,
	Mes int,
	Relatorio xml NOT NULL,
	PRIMARY KEY (Ano, Mes)
)



