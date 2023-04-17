. '.\src\Logging\Logging.ps1'
. '.\src\Create missing directories\Create Missing Directories.ps1'

CheckDirectories $PSScriptRoot

#LogWrite 
LogWriteDebug -LogString "A" -MainScriptPath $PSScriptRoot -DebugFlag $true