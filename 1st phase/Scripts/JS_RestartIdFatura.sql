USE msdb ;
GO
EXEC dbo.sp_add_job
    @job_name = N'Restart ID of Fatura' ;
GO
EXEC sp_add_jobstep
    @job_name = N'Restart ID of Fatura',
    @step_name = N'Restart IdFactura',
    @subsystem = N'TSQL',
    @command = N'EXEC ReiniciarFaturaID', 
    @retry_attempts = 5,
    @retry_interval = 5 ;
GO
EXEC dbo.sp_add_schedule
    @schedule_name = N'RunMonthly',
    @freq_type = 16, --corre todos os meses
	@freq_interval = 16,
    @active_start_time = 235959 ;
USE msdb ;
GO
EXEC sp_attach_schedule
   @job_name = N'Restart ID of Fatura',
   @schedule_name = N'RunMonthly';
GO
EXEC dbo.sp_add_jobserver
    @job_name = N'Restart ID of Fatura';
GO