$LoggingPS1 = Invoke-WebRequest "https://raw.githubusercontent.com/Bazzu85/Bazzu-Powershell-Library/master/src/Logging/Logging.ps1"
Invoke-Expression $LoggingPS1
$FoldersManagerPS1 = Invoke-WebRequest "https://raw.githubusercontent.com/Bazzu85/Bazzu-Powershell-Library/master/src/Folders%20Manager/Folders%20Manager.ps1"
Invoke-Expression $FoldersManagerPS1

CreateMissingFolder -FolderToCreate "$PSScriptRoot\log" 

#LogWrite 
LogWriteDebug -LogString "A" -MainScriptPath $PSScriptRoot -DebugFlag $true