use clinica

INSERT INTO Pessoa(bi, nif, numeroSS, nome, ultimoNome, dataNascimento, nacionalidade, email)
values(1, 1, 1111111, 'Ana', 'Sequeira', '1990-01-01', 'Portuguesa', '1111@isel.pt'),
		(2, 2, 2222222, 'Diogo', 'Poeira', '1991-02-02', 'Portuguesa', '2222@isel.pt'),
		(3, 3, 3333333, 'Susana', 'Cardoso', '1990-03-03', 'Portuguesa', '3333@isel.pt');

INSERT INTO TipoContacto(tipo, descricao)
values(1, 'Desc1'),
		(2, 'Desc2'),
		(3, 'Desc3'),
		(4, 'Desc4');

INSERT INTO Morada(ordem, rua, numero, codigoPostal, cidade, pais, tipo, pessoa)
values(1, 'Alameda Sta Marta', '11', '2855', 'Corroios', 'Portugal', 1,1),
		(2, 'Alameda Sao Joao', '12', '2855', 'Corroios', 'Portugal', 2,1),
		(3, 'Alameda Sta Marta', '13', '2855', 'Corroios', 'Portugal', 3,1),
		(1, 'Alameda Sta Marta', '11', '2855', 'Corroios', 'Portugal', 1,2),
		(2, 'Alameda Sao Joao', '12', '2855', 'Corroios', 'Portugal', 2,2),
		(3, 'Alameda Sta Marta', '13', '2855', 'Corroios', 'Portugal', 3,2),
		(1, 'Alameda Sta Marta', '11', '2855', 'Corroios', 'Portugal', 1,3),
		(2, 'Alameda Sao Joao', '12', '2855', 'Corroios', 'Portugal', 2,3),
		(3, 'Alameda Sta Marta', '13', '2855', 'Corroios', 'Portugal', 3,3);


INSERT INTO Telefone(pessoa, ordem, numero, tipo)
values(1, 1, '1', 4),
		(2, 2, '2', 3),
		(3, 3, '3', 3),
		(1, 4, '4', 1);

INSERT INTO Paciente(pessoa, numeroBenefeciario, sistemaSaude)
values(1, 1, 'aaa'),
		(2, 2, 'bbb'),
		(3, 3, 'aaa');

INSERT INTO Especialidade(nome, preco)
values('Oftm', 50),
		('Card', 100),
		('US', 12);

INSERT INTO Medico(pessoa, licencaMedica, dataLicenca, numeroPacientesDiario, numeroListadeEspera)
values(1, 11, '2015-05-14', 12, 10),
		(2, 22, '2015-05-12', 5, 1),
		(3, 33, '2015-05-3', 3, 0);

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
		('inicial', '2015-02-11', 3, 11, 3),
		('inicial', '2015-02-11', 2, 33, 1);

INSERT INTO Medicamento(principioActivo, nomeComercial, laboratorio, dose)
values('1','1','1',1.0),
		('2','2','2',2.0),
		('3','3','3',3.0),
		('4','4','4',4.0);

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
 values(1,1,'3em3h'),
		(2,2,'3em3h'),
		(3,3,'3em3h'),
		(3,1,'3em3h'),
		(1,2,'3em3h');

INSERT INTO EstadoFatura(estado)
values	('emitida'),
		('paga'),
		('emProcessamento');
		
INSERT INTO Fatura(ano,data,morada,nome,nif,montante,estado)
values(2015,'2015-03-11 11:11','aaa','Diogo',2,0,'emitida'),
		(2015,'2015-03-11 11:12','aaa','Ana',1,0,'paga'),
		(2015,'2015-03-11 11:13','aaa','Susana',3,20,'emitida'),
		(2015,'2015-03-11 11:13','aaa','Susana',3,30,'emitida'),
		(2015,'2015-04-11 11:13','aaa','Susana',3,40,'emitida'),
		(2015,'2015-01-11 11:13','aaa','Susana',3,50,'emitida'),
		(2015,'2015-08-11 11:13','aaa','Susana',3,60,'emitida'),
		(2015,'2015-03-12 11:13','aaa','Susana',3,70,'emitida'),
		(2015,'2015-03-11 11:14','aaa','Ana',1,0,'paga'),
		(2015,'2015-03-11 11:15','aaa','Diogo',2,0,'emitida'),
		(2015,'2015-05-11 11:15','aaa','Ana',1,0,'paga');

INSERT INTO Relatorio(data,descricao)
values('2015-03-11 11:11','aaaa'),
		('2015-03-11 11:12','aaaa'),
		('2015-03-11 11:13','aaaa'),
		('2015-03-11 11:14','aaaa');

INSERT INTO ItemFatura(numero,idFatura,descricao,montante)
values(1,1,'1',1),
		(1,2,'2',2),
		(1,3,'3',3),
		(1,4,'4',4);

INSERT INTO ItemFaturaRelatorio(numero,idFatura,idRelatorio)
values(1,1,1),
		(1,2,2),
		(1,3,3),
		(1,4,4);

INSERT INTO RelatorioMedico(idRelatorio,estadoClinico,prescricoes)
values(1,'1','1'),
		(2,'2',NULL);

INSERT INTO TipoExame(nome,preco)
values('1',1.0),
		('2',2.0);

INSERT INTO RelatorioExame(idRelatorio,idEquipamento,notas,resultado,tipo)
values(2,NULL,'aaaa','<ok></ok>',1),
		(3,NULL,'bbbb','<ok></ok>',2);

INSERT INTO RelatorioMensalFinanceiro(ano, mes,relatorio)
values(2015,3,'<ok></ok>'),
		(2015,4,'<ok></ok>');