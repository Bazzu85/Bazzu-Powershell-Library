Function Import-Required-Notifications-Modules () {
    [CmdletBinding()] param(
        [Parameter()]
        [string] $MainScriptPath= $(throw "Script path is mandatory ($($MyInvocation.MyCommand) function)."),
        [Parameter()]
        [PSCustomObject] $Configuration= $(throw "Configuration is mandatory ($($MyInvocation.MyCommand) function).")
    )

    if ($Configuration.sendTelegramNotification){
        if (Get-Module -ListAvailable -Name "PoshGram") {
        } else {
            Install-Module -Name "PoshGram" -Scope CurrentUser -Force
        }
        Import-Module -Name "PoshGram"
    }
    if ($Configuration.sendDiscordNotification){
        if (Get-Module -ListAvailable -Name "PSDiscord") {
        } else {
            Install-Module -Name "PSDiscord" -Scope CurrentUser -Force
        }
        Import-Module -Name "PSDiscord"
    }
}