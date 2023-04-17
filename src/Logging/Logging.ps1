Function LogWrite (){
    [CmdletBinding()] param(
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string] $LogString= $(throw "String to log is mandatory ($($MyInvocation.MyCommand) function)."),
        [Parameter()]
        [string] $MainScriptPath= $(throw "Script path is mandatory ($($MyInvocation.MyCommand) function).")
    )
    $date = Get-Date -Format "yyyyMMdd"
    $logFile = "$MainScriptPath\log\$date.log"
    Write-Host $Logstring
    $Logstring = "$(Get-Date -Format "dd/MM/yyyy HH:mm:ss") $Logstring"
    Add-content $logFile -value $Logstring
}

Function LogWriteDebug (){
    [CmdletBinding()] param(
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string] $LogString= $(throw "String to log is mandatory ($($MyInvocation.MyCommand) function)."),
        [Parameter()]
        [string] $MainScriptPath= $(throw "Script path is mandatory ($($MyInvocation.MyCommand) function)."),
        [Parameter()]
        [bool] $DebugFlag= $(throw "Debug flag is mandatory ($($MyInvocation.MyCommand) function).")
    )

    if ($DebugFlag){
        LogWrite $LogString $MainScriptPath
    }
}
Function LogWrite (){
    [CmdletBinding()] param(
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string] $LogString= $(throw "String to log is mandatory ($($MyInvocation.MyCommand) function)."),
        [Parameter()]
        [string] $MainScriptPath= $(throw "Script path is mandatory ($($MyInvocation.MyCommand) function).")
    )
    $date = Get-Date -Format "yyyyMMdd"
    $logFile = "$MainScriptPath\log\$date.log"
    Write-Host $Logstring
    $Logstring = "$(Get-Date -Format "dd/MM/yyyy HH:mm:ss") $Logstring"
    Add-content $logFile -value $Logstring
}

Function LogWriteDebug (){
    [CmdletBinding()] param(
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string] $LogString= $(throw "String to log is mandatory ($($MyInvocation.MyCommand) function)."),
        [Parameter()]
        [string] $MainScriptPath= $(throw "Script path is mandatory ($($MyInvocation.MyCommand) function)."),
        [Parameter()]
        [bool] $DebugFlag= $(throw "Debug flag is mandatory ($($MyInvocation.MyCommand) function).")
    )

    if ($DebugFlag){
        LogWrite $LogString $MainScriptPath
    }
}
Function LogWrite (){
    [CmdletBinding()] param(
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string] $LogString= $(throw "String to log is mandatory ($($MyInvocation.MyCommand) function)."),
        [Parameter()]
        [string] $MainScriptPath= $(throw "Script path is mandatory ($($MyInvocation.MyCommand) function).")
    )
    $date = Get-Date -Format "yyyyMMdd"
    $logFile = "$MainScriptPath\log\$date.log"
    Write-Host $Logstring
    $Logstring = "$(Get-Date -Format "dd/MM/yyyy HH:mm:ss") $Logstring"
    Add-content $logFile -value $Logstring
}

Function LogWriteDebug (){
    [CmdletBinding()] param(
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string] $LogString= $(throw "String to log is mandatory ($($MyInvocation.MyCommand) function)."),
        [Parameter()]
        [string] $MainScriptPath= $(throw "Script path is mandatory ($($MyInvocation.MyCommand) function)."),
        [Parameter()]
        [bool] $DebugFlag= $(throw "Debug flag is mandatory ($($MyInvocation.MyCommand) function).")
    )

    if ($DebugFlag){
        LogWrite $LogString $MainScriptPath
    }
}
Function LogWrite (){
    [CmdletBinding()] param(
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string] $LogString= $(throw "String to log is mandatory ($($MyInvocation.MyCommand) function)."),
        [Parameter()]
        [string] $MainScriptPath= $(throw "Script path is mandatory ($($MyInvocation.MyCommand) function).")
    )
    $date = Get-Date -Format "yyyyMMdd"
    $logFile = "$MainScriptPath\log\$date.log"
    Write-Host $Logstring
    $Logstring = "$(Get-Date -Format "dd/MM/yyyy HH:mm:ss") $Logstring"
    Add-content $logFile -value $Logstring
}

Function LogWriteDebug (){
    [CmdletBinding()] param(
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string] $LogString= $(throw "String to log is mandatory ($($MyInvocation.MyCommand) function)."),
        [Parameter()]
        [string] $MainScriptPath= $(throw "Script path is mandatory ($($MyInvocation.MyCommand) function)."),
        [Parameter()]
        [bool] $DebugFlag= $(throw "Debug flag is mandatory ($($MyInvocation.MyCommand) function).")
    )

    if ($DebugFlag){
        LogWrite $LogString $MainScriptPath
    }
}
