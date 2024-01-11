@echo off
rem exec-script.bat

echo Verificando scripts...
echo.

rem Definir o caminho da pasta de scripts SQL
set SCRIPT_FOLDER=.\scripts

rem Obter o caminho completo para log.bat
set LOG_SCRIPT=%~dp0\log.bat

echo Executando scripts:

rem Iterar sobre todos os arquivos na pasta de scripts
for %%f in ("%SCRIPT_FOLDER%\*.sql") do (
    echo 	- %%~nxf
    sqlcmd -S %1 -d %2 -U %3 -P %4 -i "%%f"

    rem Chamar log.bat para registrar a execução no log
    call "%LOG_SCRIPT%" %1 %2 %3 %4 "%%f"
)

rem Verificar se o comando anterior falhou
if %errorlevel% neq 0 (
    echo.
	echo ERRO: %MSG_ERRO_SCRIPT%
	echo.
    exit /b 1
)

echo.
