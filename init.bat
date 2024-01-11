@echo off
rem init.bat

rem Chamar const.bat para definir as constantes
call config\const.bat

echo.
echo.
echo @@@@    @@@@@      @@     @@  @@@@@  @@@@@    @@@@@   @@@@   @@@    @@@@
echo @@  @@  @@   @      @@   @@   @@     @@  @@  @@        @@   @@  @@  @@ @@
echo @@   @@ @@@@@        @@ @@    @@@@   @@@@@    @@@@@    @@   @@  @@  @@ @@
echo @@  @@  @@   @@       @@@     @@     @@  @@       @@   @@   @@  @@  @@ @@
echo @@@@    @@@@@@         @      @@@@@  @@   @@  @@@@@   @@@@   @@@    @@ @@
echo.
echo.

set /p COMMENT="Comentario desta execucao: "

if "%COMMENT%"=="" echo Sera utilizado o comentario padrao configurado
if "%COMMENT%"=="" set "COMMENT=%DEFAULT_COMMENT%"

echo.
echo.
echo -------------------------
echo Iniciando execucao
echo -------------------------
echo.

rem Chamar connection.bat para definir as informações de conexão
call config\connection.bat

rem Verificar se o comando anterior falhou

rem Chamar exec-script.bat pa@@ando as informações de conexão
call config\exec.bat %SERVER% %DATABASE% %USERNAME% %PASSWORD%

echo -------------------------
echo Execucao finalizada
echo -------------------------
echo.
echo.