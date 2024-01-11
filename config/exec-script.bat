@echo off
rem exec-script.bat

set DATAHORA=%date:~6,4%%date:~3,2%%date:~0,2%%time:~0,2%%time:~3,2%

rem Obter data e hora atual no formato YYYY-MM-DD HH:mm:ss

echo Database:
echo		- Servidor: %SERVER% 
echo		- Banco: %DATABASE% 
echo		- Usuario: %USERNAME%
echo.

echo Executando scripts:

rem Iterar sobre todos os arquivos na pasta de scripts
for %%f in ("%PATH_SCRIPT%\*.sql") do (
    echo 	- %%~nxf
    sqlcmd -S %1 -d %2 -U %3 -P %4 -i "%%f"

	rem Gera hash
	for /f %%H in ('certutil -hashfile "%PATH_SCRIPT%\%%~nxf" SHA256 ^| find /v ":"') do set "HASH=%%H"
	
	rem Adiciona cabeçalho
	echo -- HASH: %HASH% > temp.sql
	echo -- DATA: %DATAHORA% >> temp.sql
	echo -- AUTOR: %MAQUINA% \ %USERNAME% >> temp.sql
	echo -- COMENTARIO: %COMMENT% >> temp.sql
	echo. >> temp.sql
	type "%PATH_SCRIPT%\%%~nxf" >> temp.sql
	move /y temp.sql "%PATH_SCRIPT%\%%~nxf" >nul
	
	rem Move para pasta de executados (execs)
	move "%PATH_SCRIPT%\%%~nxf" "%PATH_SCRIPT_EXEC%\%%~nxf" >nul
	ren "%PATH_SCRIPT_EXEC%\%%~nxf" "%DATAHORA%_%%~nxf"

	rem Renomeia script
	set "FILE=%DATAHORA%_%%~nxf"

    rem Chama log
    call "%FILE_LOG%" %1 %2 %3 %4 "%%f"
)

rem Verificar se o comando anterior falhou
if %errorlevel% neq 0 (
    echo.
	echo ERRO: %MSG_ERRO_SCRIPT%
	echo.
    exit /b 1
)

echo.
