. '.\src\GitHub SRC manager.ps1'
GetSRCFromGitHub -SRCFolder "$PSScriptRoot\src" -MainScriptPath $PSScriptRoot

. '.\src\Logging\Logging.ps1'
. '.\src\Folders Manager\Folders Manager.ps1'
. '.\src\Configuration Manager\Configuration Manager.ps1'


CreateMissingFolder -FolderToCreate "$PSScriptRoot\log" 
#LogWrite 
LogWriteDebug -LogString "A" -MainScriptPath $PSScriptRoot -DebugFlag $true