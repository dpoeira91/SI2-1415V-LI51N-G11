use clinica
/*
 * Tabela que representa a entidade Pessoa
*/
CREATE TABLE Pessoa
(
	bi INT NOT NULL,
	nif INT NOT NULL UNIQUE,
	numeroSS INT NOT NULL UNIQUE,
	nome nvarchar(1000) NOT NULL,
	ultimoNome nvarchar(250) NOT NULL,
	dataNascimento date NOT NULL,
	nacionalidade nvarchar(300),
	email nvarchar(250),
	PRIMARY KEY(bi)
)

/*
* Tabela que representa a entidade TipoContacto
*/
create table TipoContacto
(
	tipo int PRIMARY KEY,
	descricao nvarchar(250) NOT NULL UNIQUE
)


/*
 * Tabela que representa a entidade Morada
*/
create table Morada
(
	pessoa int references Pessoa(bi),
	ordem smallint,
	rua nvarchar(1000) NOT NULL,
	numero nvarchar(9) NOT NULL,
	codigoPostal nvarchar(8) NOT NULL,
	cidade nvarchar(300) NOT NULL,
	pais nvarchar(300) NOT NULL,
	tipo int references TipoContacto(Tipo) NOT NULL,
	PRIMARY KEY(pessoa,ordem)
)

/*
 * Tabela que representa a entidade Telefone
*/
create table Telefone
(
	pessoa int references Pessoa(bi),
	ordem int,
	numero nvarchar(15) NOT NULL,
	tipo int NOT NULL,
	FOREIGN KEY (tipo) references TipoContacto(tipo),
	PRIMARY KEY(pessoa, ordem)
)

/*
 * Tabela que representa a entidade Paciente
*/
create table Paciente
(
	pessoa int references Pessoa(bi) NOT NULL UNIQUE,
	numeroBenefeciario int NOT NULL,
	sistemaSaude nvarchar(200) NOT NULL,
	bonus int NOT NULL,
	PRIMARY KEY(numeroBenefeciario),
	CHECK(bonus >= 0 AND bonus <= 1000)
)

/*
 * Tabela que representa a entidade Especialidade
*/
create table Especialidade
(
	idEspecialidade int PRIMARY KEY IDENTITY(1,1),
	nome nvarchar(300) NOT NULL UNIQUE,
	preco decimal(10,2) NOT NULL
)

/*
 * Tabela que representa a entidade Medico
*/
create table Medico
(
	pessoa int references Pessoa(bi) UNIQUE NOT NULL,
	licencaMedica int NOT NULL PRIMARY KEY,
	dataLicenca date NOT NULL,
	numeroPacientesDiario int NOT NULL,
	numeroListadeEspera int NOT NULL,
)

create table MedicoEspecialidade
(
	idEspecialidade int references Especialidade(idEspecialidade) NOT NULL,
	licenca int references Medico(licencaMedica) NOT NULL,
	PRIMARY KEY(licenca, idEspecialidade)
)

create table MotivoConsulta
(
	motivo nvarchar(30) NOT NULL PRIMARY KEY
)


/*
 * Tabela que representa a entidade Consulta
*/
create table Consulta 
(
	idConsulta int PRIMARY KEY IDENTITY(1,1),
	motivo nvarchar(30) NOT NULL references MotivoConsulta(motivo),
	data date NOT NULL,
	dataRegisto datetime NOT NULL DEFAULT GETDATE(),
	pacienteConsulta int NOT NULL references Paciente(numeroBenefeciario),
	medicoConsulta int NOT NULL,
	especialidadeConsulta int NOT NULL,
	FOREIGN KEY (medicoConsulta, especialidadeConsulta) references MedicoEspecialidade(licenca, idEspecialidade)-- GARANTE 1.
)


/*
 * Tabela que representa a entidade Especialidade
*/
create table Medicamento
(
	idMedicamento int PRIMARY KEY IDENTITY(1,1),
	principioActivo nvarchar(300) NOT NULL,
	nomeComercial nvarchar(300) NOT NULL,
	laboratorio nvarchar(300) NOT NULL,
	dose decimal(4,2) NOT NULL
)

create table Posologia
(
	posologia nvarchar(20) NOT NULL PRIMARY KEY
)

/*
 * Tabela que representa a entidade MedicamentoPaciente
*/
create table MedicamentoPaciente
(
	idMedicamento int,
	idPaciente int references HistoricoPaciente(pessoa) NOT NULL,
	posologia nvarchar(20) NOT NULL, 
	PRIMARY KEY (idMedicamento, idPaciente)
)


/*
 * Tabela que representa a entidade Fatura
*/
create table Fatura
(
	idFatura int NOT NULL IDENTITY(1,1),
	ano int NOT NULL,
	data datetime NOT NULL,
	morada nvarchar(2000) NOT NULL,
	nome nvarchar (1250) NOT NULL,
	nif int NOT NULL,
	montante decimal(10,2) NOT NULL DEFAULT 40.0, --???
	estado nvarchar(10) NOT NULL CHECK(estado = 'emitida' OR estado = 'paga'),
	PRIMARY KEY (idFatura)
)

/*
 * Tabela que representa a entidade Relatorio
*/
create table Relatorio
(
	idRelatorio int PRIMARY KEY IDENTITY(1,1),
	data datetime NOT NULL,
	descricao nvarchar(2000) NOT NULL,
)

/*
 * Tabela que representa a entidade ItemFatura
*/
create table ItemFatura
(
	numero int NOT NULL,
	idFatura int references Fatura(idFatura),
	descricao nvarchar(1000) NOT NULL,
	montante decimal(10,2) NOT NULL,
	PRIMARY KEY (idFatura, numero)
)

create table ItemFaturaRelatorio
(
	numero int NOT NULL,
	idFatura int NOT NULL,
	idRelatorio int references Relatorio(idRelatorio) NOT NULL UNIQUE,
	FOREIGN KEY (idFatura, numero) references ItemFatura(idFatura, numero),
	PRIMARY KEY (numero, idFatura)
)

/*
* Tabela que representa a entidade RelatorioMedico
*/
create table RelatorioMedico
(
	idRelatorio int references Relatorio(idRelatorio),
	estadoClinico nvarchar(2000) NOT NULL,
	prescricoes nvarchar(2000),
	PRIMARY KEY (idRelatorio)
)

/*
 * Tabela que representa a entidade TipoExame
*/
create table TipoExame
(
	idTipoExame int PRIMARY KEY NOT NULL IDENTITY(1,1),
	nome nvarchar(500) NOT NULL,
	preco decimal(10,2) NOT NULL
)

/*
 * Tabela que representa a entidade RelatorioMedico
*/
create table RelatorioExame
(
	idRelatorio int references Relatorio(idRelatorio),
	idEquipamento int,
	notas nvarchar(2000),
	resultado xml/*(examesMedicosXSD)*/ NOT NULL,
	tipo int references TipoExame(idTipoExame) NOT NULL,
	PRIMARY KEY (idRelatorio)
)

/*
 * Tabela que representa a entidade RelatorioMensalFinanceiroc
*/
create table RelatorioMensalFinanceiro
(
	ano int NOT NULL,
	mes int NOT NULL,
	relatorio xml NOT NULL,
	PRIMARY KEY (ano, mes)
)

--Tabelas do Historico de Pacientes


/*
 * Tabela que representa a entidade Pessoa
*/
CREATE TABLE HistoricoPaciente
(
	bi INT NOT NULL,
	nif INT ,
	numeroSS INT,
	nome nvarchar(1000),
	ultimoNome nvarchar(250),
	dataNascimento date ,
	nacionalidade nvarchar(300),
	email nvarchar(250),
	
	--atributos de morada assume se  que fica a morada com ordem 1
	rua nvarchar(1000) ,
	numero nvarchar(9) ,
	codigoPostal nvarchar(8) ,
	cidade nvarchar(300),
	pais nvarchar(300),
	
	--atributos de telefone assume se  que fica o telefone com ordem 1
	numero nvarchar(15),
	
	--atrubitos de Paciente
	numeroBenefeciario int,
	sistemaSaude nvarchar(200) ,
	bonus int,
	PRIMARY KEY(numeroBenefeciario),
)

/*
 * Tabela que representa a entidade MedicamentoPaciente
*/
create table HistoricoMedicamentoPaciente
(
	idMedicamento int,
	idPaciente int references HistoricoPessoa(numeroBenefeciario) ,
	posologia nvarchar(20),
	PRIMARY KEY (idMedicamento, idPaciente)
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
