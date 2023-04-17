$LoggingPS1 = Invoke-WebRequest "https://raw.githubusercontent.com/Bazzu85/Bazzu-Powershell-Library/master/src/Logging/Logging.ps1"
Invoke-Expression $LoggingPS1
$CreateMissingDirectoriesPS1 = Invoke-WebRequest "https://raw.githubusercontent.com/Bazzu85/Bazzu-Powershell-Library/master/src/Create%20missing%20directories/Create%20Missing%20Directories.ps1"
Invoke-Expression $CreateMissingDirectoriesPS1

CheckDirectories 

#LogWrite 
LogWriteDebug -LogString "A" -MainScriptPath $PSScriptRoot -DebugFlag $true