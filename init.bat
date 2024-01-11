@echo off
rem init.bat
rem cls

rem Chamar const.bat para definir as constantes
call config\const.bat

:menu
echo.
echo.
echo @@@@    @@@@@      @@     @@  @@@@@  @@@@@    @@@@@   @@@@   @@@    @@@@
echo @@  @@  @@   @      @@   @@   @@     @@  @@  @@        @@   @@  @@  @@ @@
echo @@   @@ @@@@@        @@ @@    @@@@   @@@@@    @@@@@    @@   @@  @@  @@ @@
echo @@  @@  @@   @@       @@@     @@     @@  @@       @@   @@   @@  @@  @@ @@
echo @@@@    @@@@@@         @      @@@@@  @@   @@  @@@@@   @@@@   @@@    @@ @@
echo.
echo.
echo -------------------------
echo Menu
echo -------------------------
echo.
echo 1. Execucao de script
echo 2. Comparacao de bancos
echo 9. Sair
echo.

set /p "OPCAO=Escolha uma das opcoes: "

if "%OPCAO%" equ "1" (

	set /p COMMENT="Comentario desta execucao: "
	if "%COMMENT%"=="" set "COMMENT=%DEFAULT_COMMENT%"

	echo.
	echo -------------------------
	echo Iniciando - Script
	echo -------------------------
	echo.
	
	call "%FILE_EXEC_SCRIPT%" %SERVER% %DATABASE% %USERNAME% %PASSWORD%
	
	echo -------------------------
	echo Execucao finalizada
	echo -------------------------
	echo.
	echo.
	echo Pressione qualquer tecla para continuar...
	pause >nul
	
) else if "%OPCAO%" equ "2" (
    
	set /p COMMENT="Comentario desta execucao: "
	if "%COMMENT%"=="" set "COMMENT=%DEFAULT_COMMENT%"
	
	echo.
	echo -------------------------
	echo Iniciando - Compare
	echo -------------------------
	echo.
	
	call "%FILE_EXEC_COMPARE%" %SERVER% %DATABASE% %USERNAME% %PASSWORD%
	
	echo -------------------------
	echo Execucao finalizada
	echo -------------------------
	echo.
	echo.
	echo Pressione qualquer tecla para continuar...
	pause >nul
	
) else if "%OPCAO%" equ "9" (
    echo Encerrando...
	echo.
    goto :eof
	
) else (
    echo Opção invalida. Por favor, escolha uma opção valida.
    pause
    goto menu
)

goto menu

