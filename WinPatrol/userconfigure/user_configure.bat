@setlocal enableextensions
@cd /d "%~dp0"

for /f %%a in (current_users.txt) do (
	net localgroup administrators "%%a" /del
	net user "%%a" /active:no
)

for /f %%b in (authorized_users.txt) do (
	net user "%%b" /active:yes
)

for /f %%y in (authorized_admins.txt) do (
    net user "%%y" /active:yes
	net localgroup administrators "%%y" /add
)


