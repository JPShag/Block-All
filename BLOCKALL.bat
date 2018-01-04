@ setlocal enableextensions  //This ensures that environment changes made are local to the batch file and restored upon exit.
@ cd /d "%~dp0"

//Initializing process for the functions below.
//If you only want inbound or outbound blocked delete the corresponding line below.
for /R %%a in (*.exe) do (
netsh advfirewall firewall add rule name="Blocked with Batchfile %%a" dir=in program="%%a" action=block //inbound rules
netsh advfirewall firewall add rule name="Blocked with Batchfile %%a" dir=out program="%%a" action=block //outbound rules
)
