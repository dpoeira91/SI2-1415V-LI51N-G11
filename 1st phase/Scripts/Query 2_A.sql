use clinica

GO
CREATE TYPE TableType AS TABLE 
    ( TableName NVARCHAR(20));
GO
CREATE PROC p2aListMedico
AS BEGIN 
SELECT * FROM Medico 
END
GO

GO
CREATE PROC p2aListPaciente @Table TableType READONLY 
AS BEGIN 
SELECT * FROM @Table 
END
GO
DROP PROC p2aListPaciente
GO