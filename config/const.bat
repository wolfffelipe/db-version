@echo off
rem const.bat

rem Geral
set MSG_ERRO_CONEXAO=Ocorreu um erro durante a conexao
set MSG_ERRO_SCRIPT=Ocorreu um erro durante a executao dos scripts
set DEFAULT_COMMENT=Execucao sem comentario personalizado
set MAQUINA=%USERDOMAIN%
set FILE_LOG=%~dp0\log.bat
set FILE_EXEC_SCRIPT=%~dp0\exec-script.bat
set FILE_EXEC_COMPARE=%~dp0\exec-compare.bat

rem Caminhos
set PATH_SCRIPT=.\scripts
set PATH_SCRIPT_EXEC=.\scripts\execs

rem Banco a ser alterado
set SERVER=[SERVIDOR_1]
set DATABASE=[DB_1]
set USERNAME=[USUARIO_1]
set PASSWORD=[SENHA_1]

rem Banco a ser comparado
set SERVER_REF=[SERVIDOR_2]
set DATABASE_REF=[DB_2]
set USERNAME_REF=[USUARIO_2]
set PASSWORD_REF=[SENHA_2]