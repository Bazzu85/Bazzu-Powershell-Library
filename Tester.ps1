. '.\src\GitHub SRC manager.ps1'
GetSRCFromGitHub -SRCFolder "$PSScriptRoot\src" -MainScriptPath $PSScriptRoot

. '.\src\Logging\Logging.ps1'
. '.\src\Folders Manager\Folders Manager.ps1'
. '.\src\Configuration Manager\Configuration Manager.ps1'
. '.\src\Notifications\Import required notifications modules.ps1'
. '.\src\Notifications\Send Notification.ps1'


CreateMissingFolder -FolderToCreate "$PSScriptRoot\log" 
CreateMissingFolder -FolderToCreate "$PSScriptRoot\configuration" 
# LogWrite 
# LogWriteDebug -LogString "A" -MainScriptPath $PSScriptRoot -DebugFlag $true
# Generate a Default object
$defaultConfiguration = [PSCustomObject]@{
    debug = $true;
}
$configuration = Get-ConfigurationFromJson -DefaultConfiguration $defaultConfiguration -MainScriptPath $PSScriptRoot #-ConfigurationFileName "sync Configuration.jso"