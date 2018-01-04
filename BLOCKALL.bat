@ setlocal enableextensions  //This ensures that environment changes made are local to the batch file and restored upon exit.
@ cd /d "%~dp0"


for /R %%a in (*.exe) do ( //Initializing process for the functions below.

//If you only want inbound or outbound blocked and not both delete the corresponding line below.
netsh advfirewall firewall add rule name="Blocked with Batchfile %%a" dir=in program="%%a" action=block //inbound rules

netsh advfirewall firewall add rule name="Blocked with Batchfile %%a" dir=out program="%%a" action=block //outbound rules
)
