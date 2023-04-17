Function Send-Notification (){
    [CmdletBinding()] param(
        [Parameter()]
        [string] $NotificationMessage= $(throw "Message to send is mandatory ($($MyInvocation.MyCommand) function)."),
        [Parameter()]
        [string] $MainScriptPath= $(throw "Script path is mandatory ($($MyInvocation.MyCommand) function)."),
        [Parameter()]
        [PSCustomObject] $Configuration= $(throw "Configuration is mandatory ($($MyInvocation.MyCommand) function).")
    )
    if ($Configuration.sendTelegramNotification){
        if ($Configuration.telegramSendSilent){
            Send-TelegramTextMessage -BotToken $Configuration.telegramToken -ChatID $Configuration.telegramChatid -Message $NotificationMessage -DisableNotification
        } else {
            Send-TelegramTextMessage -BotToken $Configuration.telegramToken -ChatID $Configuration.telegramChatid -Message $NotificationMessage
        }
    }

    if ($Configuration.sendDiscordNotification){
        Send-DiscordMessage -WebHookUrl $Configuration.discordUri -Text $NotificationMessage -AvatarName $Configuration.discordAuthor
    }
}
