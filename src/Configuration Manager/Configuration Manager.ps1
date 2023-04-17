Function Get-ConfigurationFromJson () {
    [CmdletBinding()] param(
        [Parameter()]
        [Parameter()]
        [string] $MainScriptPath= $(throw "Script path is mandatory ($($MyInvocation.MyCommand) function).")
    )

    $configurationFile = "$MainScriptPath\configuration\configuration.json"

    LogWrite "Loading configuration file from $configurationFile" $MainScriptPath
    
    if (!(Test-Path -LiteralPath "$MainScriptPath\configuration")){
        New-Item -Path ("$MainScriptPath\configuration") -ItemType Directory -Force
    }

    # Generate a Default object
    $defaultConfiguration = [PSCustomObject]@{
        checkInterval = 1;
        debug = $true;
        waitMinutesBetweenTelegramNotifications = 30;
        interfaceToCheck = "";
        openvpnPath = "c:\Program Files\OpenVPN\bin\openvpn-gui.exe";
        openvpnArgument = "--connect it150.nordvpn.com.udp1194.ovpn";
        sendTelegramNotification = $false
        telegramToken = "";
        telegramChatid = "";
        telegramSendSilent = $true;
        sendDiscordNotification = $false
        discordUri = "";
        discordAuthor = "Powershell notificator";
        manageEmule = $false;
        emulePath = "C:\Program Files\eMule\emule.exe";
        startMylarService = $false;
        stopMylarService = $false;
        mylarServiceName = "Mylar";
    }
    # If not found, create the config file
    if (!(Test-Path -Path $configurationFile)){
        LogWrite "No configuration found. Creating a default configuration.json and closing." $MainScriptPath
        pause
        ConvertTo-Json -InputObject $defaultConfiguration | Out-File $configurationFile
        exit 
    }
    # Read the configuration from json file
    $configuration = Get-Content -LiteralPath $configurationFile | ConvertFrom-Json

    # Call the function to add missing variable from the json
    $configuration = AddMissingProperties $MainScriptPath $configuration $defaultConfiguration $configurationFile

    # display the configuration
    LogWrite "Configuration returned" $MainScriptPath
    foreach ($property in $configuration.PSobject.Properties){
        LogWrite " $($property.Name): $($property.value)" $MainScriptPath
    }

    return $configuration
}

Function AddMissingProperties($MainScriptPath, $configuration, $defaultConfiguration, $configurationFile){
    
    $addedProperties = 0
    # https://stackoverflow.com/questions/26997511/how-can-you-test-if-an-object-has-a-specific-property
    # https://stackoverflow.com/questions/37688708/iterate-over-psobject-properties-in-powershell
    # iterate the two object properties to find the missing ones and add it to the running configuration
    # this is to automatically allign the code added variables
    foreach ($defaultProperty in $defaultConfiguration.PSobject.Properties){
        # Write-Host $defaultProperty.Name
        # Write-Host $defaultProperty.Value
        $found = $false
        foreach ($property in $configuration.PSobject.Properties){
            if ($property.Name -eq $defaultProperty.Name){
                $found = $true
                LogWriteDebug "$($defaultProperty.Name) found" $MainScriptPath $configuration.debug
                break
            }
        }
        if (!$found){
            $configuration = $configuration | Add-Member -NotePropertyMembers @{ $defaultProperty.Name=$defaultProperty.Value } -PassThru 
            LogWrite "$($defaultProperty.Name) not found. Adding it to configuration file" $MainScriptPath
            $addedProperties++
        }
    }

    if ($addedProperties -gt 0){
        LogWrite "Added some properties to the configuration file. Closing this run" $MainScriptPath
        pause
        ConvertTo-Json -InputObject $configuration | Out-File $configurationFile
        exit
    }

    return $configuration
}

Function Get-ConfigurationLastWriteTime ($MainScriptPath, $configuration) {
    $configurationFile = "$MainScriptPath\configuration\configuration.json"
    $configurationAttributes = Get-ChildItem -LiteralPath $configurationFile
    LogWriteDebug "Configuration last write time: $($configurationAttributes.LastWriteTime)" $MainScriptPath $configuration.debug
    return $configurationAttributes.LastWriteTime
}