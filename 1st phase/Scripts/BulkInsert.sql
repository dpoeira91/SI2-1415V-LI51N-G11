use clinica

INSERT INTO Pessoa(Bi, Nif, NumeroSS, Nome, UltimoNome, DataNascimento, Nacionalidade, Email)
values(1, 111111111, 1111111, 'Ana', 'Sequeira', '1990-01-01', 'Portuguesa', '1111@isel.pt'),
		(2, 222222222, 2222222, 'Diogo', 'Poeira', '1991-02-02', 'Portuguesa', '2222@isel.pt'),
		(3, 333333333, 3333333, 'Susana', 'Cardoso', '1990-03-03', 'Portuguesa', '3333@isel.pt');

INSERT INTO TipoContacto(Tipo, Descricao)
values(1, 'Desc1'),
		(2, 'Desc2'),
		(3, 'Desc3'),
		(4, 'Desc4');

INSERT INTO Morada(Ordem, Rua, Numero, CodigoPostal, Cidade, Pais, Tipo)
values(1, 'Alameda Sta Marta', '11', '2855', 'Corroios', 'Portugal', 1),
		(2, 'Alameda Sao Joao', '12', '2855', 'Corroios', 'Portugal', 2),
		(3, 'Alameda Sta Marta', '13', '2855', 'Corroios', 'Portugal', 3);

INSERT INTO MoradaPessoa(Pessoa, Ordem)
values(1, 1),
		(2, 3),
		(3, 2),
		(1, 2);

INSERT INTO Telefone(Pessoa, Ordem, Numero, Tipo)
values(1, 1, '1', 4),
		(2, 2, '2', 3),
		(3, 3, '3', 3),
		(1, 4, '4', 1);

INSERT INTO Paciente(Pessoa, NumeroBenefeciario, SistemaSaude, Bonus)
values(1, 1, 'aaa', 0),
		(2, 2, 'bbb', 0),
		(3, 3, 'aaa', 0);

INSERT INTO Especialidade(IdEspecialidade, Nome, Preco)
values(1, 'Oftm', 50),
		(2, 'Card', 100),
		(3, 'US', 12);

INSERT INTO Medico(Pessoa, LicencaMedica, DataLicenca, NumeroPacientesDiario, NumeroListadeEspera)
values(1, '11', '2015-05-14', 12, 10),
		(2, '22', '2015-05-12', 5, 1),
		(3, '33', '2015-05-3', 3, 0);

INSERT INTO MedicoEspecialidade(IdEspecialidade, Pessoa)
values(1, 1),
		(1, 2),
		(1, 3),
		(2, 3),
		(3, 1);

INSERT INTO Consulta(IdConsulta, Motivo, Data, DataRegisto, PacienteConsulta, MedicoConsulta, EspecialidadeConsulta)
values(1, 'inicial', '2015-02-10', '2015-02-11', 2, 1, 1),
		(2, 'acompanhamento', '2015-12-05', '2015-12-11', 1, 2, 1),
		(3, 'inicial', '2015-02-10', '2015-02-11', 3, 1, 3),
		(4, 'inicial', '2015-02-10', '2015-02-11', 2, 3, 1);

INSERT INTO Medicamento(IdMedicamento, PrincipioActivo, NomeComercial, Laboratorio, Dose)
values(1,'1','1','1',1.0),
		(2,'2','2','2',2.0),
		(3,'3','3','3',3.0),
		(4,'4','4','4',4.0);
INSERT INTO MedicamentoPaciente(IdMedicamento,IdPaciente, Posologia)
 values(1,1,'3em3h'),
		(2,2,'3em3h'),
		(3,3,'3em3h'),
		(3,1,'3em3h'),
		(1,2,'3em3h');
INSERT INTO Fatura(IdFatura,Ano,Data,Morada,Nome,Nif,Montante,Estado)
values(1,2015,'2015-03-11 11:11','aaa','Diogo',2,0,'emitida'),
		(2,2015,'2015-03-11 11:12','aaa','Ana',1,0,'emitida'),
		(3,2015,'2015-03-11 11:13','aaa','Susana',3,0,'emitida'),
		(9,2015,'2015-03-11 11:13','aaa','Susana',3,0,'emitida'),
		(6,2015,'2015-03-11 11:13','aaa','Susana',3,0,'emitida'),
		(7,2015,'2015-03-11 11:13','aaa','Susana',3,0,'emitida'),
		(8,2015,'2015-03-11 11:13','aaa','Susana',3,0,'emitida'),
		(4,2015,'2015-03-11 11:14','aaa','Ana',1,0,'emitida'),
		(5,2015,'2015-03-11 11:15','aaa','Diogo',2,0,'emitida');
INSERT INTO Relatorio(IdRelatorio,Data,Descricao)
values(1,'2015-03-11 11:11','aaaa'),
		(2,'2015-03-11 11:12','aaaa'),
		(3,'2015-03-11 11:13','aaaa'),
		(4,'2015-03-11 11:14','aaaa');
INSERT INTO ItemFatura(Numero,IdFatura,Descricao,Montante)
values(1,1,'1',1),
		(1,2,'2',2),
		(1,3,'3',3),
		(1,4,'4',4);
INSERT INTO ItemFaturaRelatorio(Numero,IdFatura,IdRelatorio)
values(1,1,1),
		(1,2,2),
		(1,3,3),
		(1,4,4);
INSERT INTO RelatorioMedico(IdRelatorio,EstadoClinico,Prescricoes)
values(1,'1','1'),
		(2,'2',NULL);
INSERT INTO TipoExame(IdTipoExame,Nome,Preco)
values(1,'1',1.0),
		(2,'2',2.0);
INSERT INTO RelatorioExame(IdRelatorio,IdEquipamento,Notas,Resultado,Tipo)
values(2,NULL,'aaaa','<ok></ok>',1),
		(3,NULL,'bbbb','<ok></ok>',2);
INSERT INTO RelatorioMensalFinanceiro(Ano, Mes,Relatorio)
values(2015,3,'<ok></ok>'),
		(2015,4,'<ok></ok>');