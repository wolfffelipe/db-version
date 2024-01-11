@echo off
rem log.bat

sqlcmd -S %1 -d %2 -U %3 -P %4 -Q "IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'DBVersionLog') CREATE TABLE DBVersionLog (ID INT IDENTITY NOT NULL, ARQUIVO VARCHAR(200) NULL, USUARIO VARCHAR(100) NULL, DT DATETIME);"

sqlcmd -S %1 -d %2 -U %3 -P %4 -Q "SET NOCOUNT ON; INSERT INTO DBVersionLog (ARQUIVO, USUARIO, DATA, COMENTARIO, MAQUINA) VALUES ('%~nx5', '%USERNAME%', GETDATE(), '%COMMENT%', '%MAQUINA%');"
