use clinica

INSERT INTO Meta(limiteListaEspera,montanteBase)values(10,40)

INSERT INTO Pessoa(bi, nif, numeroSS, nome, ultimoNome, dataNascimento, nacionalidade, email)
values  (1, 1, 1111111, 'Ana', 'Sequeira', '1990-01-01', 'Portuguesa', '1111@isel.pt'),
		(2, 2, 2222222, 'Diogo', 'Poeira', '1991-02-02', 'Portuguesa', '2222@isel.pt'),
		(3, 3, 3333333, 'Susana', 'Cardoso', '1990-03-03', 'Portuguesa', '3333@isel.pt');

INSERT INTO TipoContacto(tipo, descricao)
values  (1, 'Desc1'),
		(2, 'Desc2'),
		(3, 'Desc3'),
		(4, 'Desc4');

INSERT INTO Telefone(pessoa, ordem, numero, tipo)
values  (1, 1, '0111111111', 4),
		(2, 2, '0222222222', 3),
		(3, 3, '0333333333', 3),
		(1, 4, '0444444444', 1);

INSERT INTO Paciente(pessoa, numeroBenefeciario, sistemaSaude)
values  (1, 1, 'aaa'),
		(2, 2, 'bbb'),
		(3, 3, 'aaa');

INSERT INTO Especialidade(nome, preco)
values  ('Oftm', 50),
		('Card', 100),
		('US', 12);

INSERT INTO Medico(pessoa, licencaMedica, dataLicenca, numeroPacientesDiario)
values  (1, 11, '2015-05-14', 12),
		(2, 22, '2015-05-12', 5),
		(3, 33, '2015-05-3', 3);

INSERT INTO MedicoEspecialidade(idEspecialidade, licenca)
values(1, 11),
		(1, 22),
		(1, 33),
		(2, 33),
		(3, 11);

INSERT INTO MotivoConsulta(motivo)
values('inicial'),
		('acompanhamento'),
		('apresentarExames'),
		('posOperatorio'),
		('medicacao');

INSERT INTO Consulta(motivo, data, pacienteConsulta, medicoConsulta, especialidadeConsulta)
values('inicial', '2015-02-11', 2, 11, 1),
		('acompanhamento','2015-12-11', 1, 22, 1),
		('inicial', '2015-02-11', 3, 11, 3),
		('inicial', '2015-02-11', 3, 11, 1),
		('inicial', '2015-02-11', 2, 33, 1);

INSERT INTO Medicamento(principioActivo, nomeComercial, laboratorio, dose)
values  ('PA1','medicamento1','Lab1',1.0),
		('PA2','medicamento2','Lab2',2.0),
		('PA3','medicamento3','Lab3',3.0),
		('PA4','medicamento4','Lab4',4.0);

INSERT INTO Posologia(posologia)
values('3em3h'),
		('8em8h'),
		('12em12h'),
		('manha'),
		('almoco'),
		('jantar'),
		('aoDeitar'),
		('emJejum');

INSERT INTO MedicamentoPaciente(idMedicamento,idPaciente, posologia)
 values	(4,1,'aoDeitar'),
		(1,1,'3em3h'),
		(2,2,'3em3h'),
		(3,3,'3em3h'),
		(3,1,'3em3h'),
		(1,2,'3em3h');

INSERT INTO EstadoFatura(estado)
values	('emitida'),
		('paga'),
		('emProcessamento');
		
INSERT INTO Fatura(idFatura,ano,data,morada,nome,nif,montante,estado)
values(NEXT VALUE FOR FacturaID,2015,'2015-03-11 11:11','aaa','Diogo',2,0,'emitida'),
		(NEXT VALUE FOR FacturaID,2015,'2015-03-11 11:12','aaa','Ana',1,0,'paga'),
		(NEXT VALUE FOR FacturaID,2015,'2015-03-11 11:13','aaa','Susana',3,20,'emitida'),
		(NEXT VALUE FOR FacturaID,2015,'2015-03-11 11:13','aaa','Susana',3,30,'emitida'),
		(NEXT VALUE FOR FacturaID,2015,'2015-04-11 11:13','aaa','Susana',3,40,'emitida'),
		(NEXT VALUE FOR FacturaID,2015,'2015-01-11 11:13','aaa','Susana',3,50,'emitida'),
		(NEXT VALUE FOR FacturaID,2015,'2015-08-11 11:13','aaa','Susana',3,60,'emitida'),
		(NEXT VALUE FOR FacturaID,2015,'2015-03-12 11:13','aaa','Susana',3,70,'emitida'),
		(NEXT VALUE FOR FacturaID,2015,'2015-03-11 11:14','aaa','Ana',1,0,'paga'),
		(NEXT VALUE FOR FacturaID,2015,'2015-03-11 11:15','aaa','Diogo',2,0,'emitida'),
		(NEXT VALUE FOR FacturaID,2015,'2015-05-11 11:15','aaa','Ana',1,0,'paga');

INSERT INTO Relatorio(data,descricao)
values  ('2015-03-11 11:11','relatorio1'),
		('2015-03-11 11:12','relatorio2'),
		('2015-03-11 11:13','relatorio3'),
		('2015-03-11 11:14','relatorio3');

INSERT INTO ItemFatura(numero,idFatura,descricao,montante)
values  (1,1,'desc1',1),
		(1,2,'desc2',2),
		(1,3,'desc3',3),
		(1,4,'desc4',4);

INSERT INTO ItemFaturaRelatorio(numero,idFatura,idRelatorio)
values(1,1,1),
		(1,2,2),
		(1,3,3),
		(1,4,4);

INSERT INTO RelatorioMedico(idRelatorio,estadoClinico,prescricoes)
values  (1,'estadoClinico1','1'),
		(2,'estadoClinico2',NULL);

INSERT INTO TipoExame(nome,preco)
values  ('tipoExame1',1.0),
		('tipoExame2',2.0);

INSERT INTO RelatorioExame(idRelatorio,idEquipamento,notas,resultado,tipo)
values  (2,NULL,'notas1','<ok></ok>',1),
		(3,NULL,'notas2','<ok></ok>',2);

INSERT INTO RelatorioMensalFinanceiro(ano, mes,relatorio)
values(2015,3,'<ok></ok>'),
		(2015,4,'<ok></ok>');