Function Get-ConfigurationFromJson () {
    [CmdletBinding()] param(
        [Parameter()]
        [PSCustomObject] $DefaultConfiguration= $(throw "Default configuration is mandatory ($($MyInvocation.MyCommand) function)."),
        [Parameter()]
        [string] $MainScriptPath= $(throw "Script path is mandatory ($($MyInvocation.MyCommand) function)."),
        [Parameter()]
        [string] $ConfigurationFileName= "configuration.json"
    )

    $configurationFile = "$MainScriptPath\configuration\$ConfigurationFileName"

    $logMessage = "Loading configuration file from $configurationFile"
    LogWrite -LogString $logMessage -MainScriptPath $MainScriptPath
    
    if (!(Test-Path -LiteralPath "$MainScriptPath\configuration")){
        New-Item -Path ("$MainScriptPath\configuration") -ItemType Directory -Force
    }

    # If not found, create the config file
    if (!(Test-Path -Path $configurationFile)){
        $logMessage = "No configuration found. Creating a default $ConfigurationFileName and closing."
        LogWrite -LogString $logMessage -MainScriptPath $MainScriptPath
        pause
        ConvertTo-Json -InputObject $defaultConfiguration | Out-File $configurationFile
        exit 
    }
    # Read the configuration from json file
    $configuration = Get-Content -LiteralPath $configurationFile | ConvertFrom-Json

    # Call the function to add missing variable from the json
    $configuration = AddMissingProperties $MainScriptPath $configuration $defaultConfiguration $configurationFile

    # display the configuration
    $logMessage = "Configuration returned"
    LogWrite -LogString $logMessage -MainScriptPath $MainScriptPath
    foreach ($property in $configuration.PSobject.Properties){
        $logMessage = " $($property.Name): $($property.value)"
        LogWrite -LogString $logMessage -MainScriptPath $MainScriptPath
    }

    return $configuration
}

Function AddMissingProperties(){
    [CmdletBinding()] param(
        [Parameter()]
        [string] $MainScriptPath= $(throw "Script path is mandatory ($($MyInvocation.MyCommand) function)."),
        [Parameter()]
        [PSCustomObject] $Configuration= $(throw "Configuration to work on is mandatory ($($MyInvocation.MyCommand) function)."),
        [Parameter()]
        [PSCustomObject] $DefaultConfiguration= $(throw "Default configuration is mandatory ($($MyInvocation.MyCommand) function)."),
        [Parameter()]
        [string] $ConfigurationFile= $(throw "Configuration file is mandatory ($($MyInvocation.MyCommand) function).")
    )

    $addedProperties = 0
    # https://stackoverflow.com/questions/26997511/how-can-you-test-if-an-object-has-a-specific-property
    # https://stackoverflow.com/questions/37688708/iterate-over-psobject-properties-in-powershell
    # iterate the two object properties to find the missing ones and add it to the running configuration
    # this is to automatically allign the code added variables
    foreach ($defaultProperty in $DefaultConfiguration.PSobject.Properties){
        # Write-Host $defaultProperty.Name
        # Write-Host $defaultProperty.Value
        $found = $false
        foreach ($property in $Configuration.PSobject.Properties){
            if ($property.Name -eq $defaultProperty.Name){
                $found = $true
                $logMessage = "$($defaultProperty.Name) found"
                LogWriteDebug -LogString $logMessage -MainScriptPath $MainScriptPath -DebugFlag $configuration.debug
                break
            }
        }
        if (!$found){
            $Configuration = $Configuration | Add-Member -NotePropertyMembers @{ $defaultProperty.Name=$defaultProperty.Value } -PassThru 
            $logMessage = "$($defaultProperty.Name) not found. Adding it to Configuration file"
            LogWrite -LogString $logMessage -MainScriptPath $MainScriptPath
            $addedProperties++
        }
    }

    if ($addedProperties -gt 0){
        $logMessage ="Added some properties to the configuration file. Closing this run"
        LogWrite -LogString $logMessage -MainScriptPath $MainScriptPath
        pause
        ConvertTo-Json -InputObject $Configuration | Out-File $ConfigurationFile
        exit
    }

    return $configuration
}

Function Get-ConfigurationLastWriteTime () {
    [CmdletBinding()] param(
        [Parameter()]
        [string] $MainScriptPath= $(throw "Script path is mandatory ($($MyInvocation.MyCommand) function)."),
        [Parameter()]
        [PSCustomObject] $Configuration= $(throw "Configuration to work on is mandatory ($($MyInvocation.MyCommand) function)."),
        [Parameter()]
        [string] $ConfigurationFileName= "configuration.json"

    )
    $configurationFile = "$MainScriptPath\configuration\$ConfigurationFileName"
    $configurationAttributes = Get-ChildItem -LiteralPath $configurationFile
    $logMessage = "Configuration last write time: $($configurationAttributes.LastWriteTime)"
    LogWriteDebug -LogString $logMessage -MainScriptPath $MainScriptPath -DebugFlag $configuration.debug
    return $configurationAttributes.LastWriteTime
}