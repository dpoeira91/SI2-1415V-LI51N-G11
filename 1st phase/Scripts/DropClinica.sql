use clinica

if OBJECT_ID('HistoricoConsulta') is not null 
Drop Table HistoricoConsulta

if OBJECT_ID('HistoricoMedicamentoPaciente') is not null 
Drop Table HistoricoMedicamentoPaciente

if OBJECT_ID('HistoricoTelefone') is not null 
Drop Table HistoricoTelefone

if OBJECT_ID('HistoricoMorada') is not null 
Drop Table HistoricoMorada

if OBJECT_ID('HistoricoPaciente') is not null 
Drop Table HistoricoPaciente

if OBJECT_ID('RelatorioMensalFinanceiro') is not null --verificação para garantir que existe a tabela antes de a apagar senão vai dar erro no drop
Drop Table RelatorioMensalFinanceiro

if OBJECT_ID('RelatorioExame') is not null 
Drop Table RelatorioExame

if OBJECT_ID('TipoExame') is not null 
Drop Table TipoExame

if OBJECT_ID('RelatorioMedico') is not null 
Drop Table RelatorioMedico

if OBJECT_ID('ItemFaturaRelatorio') is not null 
Drop Table ItemFaturaRelatorio

if OBJECT_ID('ItemFatura') is not null 
Drop Table ItemFatura

if OBJECT_ID('Relatorio') is not null 
Drop Table Relatorio

if OBJECT_ID('Fatura') is not null 
Drop Table Fatura

if OBJECT_ID('EstadoFatura') is not null 
Drop Table EstadoFatura

if OBJECT_ID('MedicamentoPaciente') is not null 
Drop Table MedicamentoPaciente

if OBJECT_ID('Posologia') is not null 
Drop Table Posologia

if OBJECT_ID('Medicamento') is not null 
Drop Table Medicamento

if OBJECT_ID('Consulta') is not null 
Drop Table Consulta

if OBJECT_ID('MotivoConsulta') is not null
Drop Table MotivoConsulta

if OBJECT_ID('MedicoEspecialidade') is not null 
Drop Table MedicoEspecialidade

if OBJECT_ID('Medico') is not null 
Drop Table Medico

if OBJECT_ID('Especialidade') is not null 
Drop Table Especialidade

if OBJECT_ID('BonusPaciente') is not null 
Drop Table BonusPaciente

if OBJECT_ID('Paciente') is not null 
Drop Table Paciente

if OBJECT_ID('Telefone') is not null 
Drop Table Telefone

if OBJECT_ID('Morada') is not null 
Drop Table Morada

if OBJECT_ID('TipoContacto') is not null 
Drop Table TipoContacto

if OBJECT_ID('Pessoa') is not null 
Drop Table Pessoa

if OBJECT_ID('Meta') is not null 
Drop Table Meta
