use clinica
GO

IF OBJECT_ID('FacturaID') is not null
DROP SEQUENCE FacturaID
GO

CREATE SEQUENCE FacturaID
	AS INT
    START WITH 1
    INCREMENT BY 1;
GO
