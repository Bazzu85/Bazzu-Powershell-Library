Function GetSRCFromGitHub (){
    [CmdletBinding()] param(
        [Parameter()]
        [string] $SRCFolder= $(throw "SRC folder is mandatory ($($MyInvocation.MyCommand) function)."),
        [Parameter()]
        [string] $MainScriptPath= $(throw "Script path is mandatory ($($MyInvocation.MyCommand) function).")
    )
    if (!(Test-Path -LiteralPath $SRCFolder)){
        New-Item -Path ($SRCFolder) -ItemType Directory -Force
    }

    # Get the folders manager functions
    $FoldersManagerDestinationFolder = "$SRCFolder\Folders Manager"
    if (!(Test-Path -LiteralPath $FoldersManagerDestinationFolder)){
        New-Item -Path ($FoldersManagerDestinationFolder) -ItemType Directory -Force
    }
    $FoldersManagerPS1 = Invoke-WebRequest "https://raw.githubusercontent.com/Bazzu85/Bazzu-Powershell-Library/master/public/Folders%20Manager/Folders%20Manager.ps1"
    $FoldersManagerDestinationFile = "$FoldersManagerDestinationFolder\Folders Manager.ps1"
    Add-content $FoldersManagerDestinationFile -value $FoldersManagerPS1

    # Get the logging functions
    $LoggingDestinationFolder = "$SRCFolder\Logging"
    if (!(Test-Path -LiteralPath $LoggingDestinationFolder)){
        New-Item -Path ($LoggingDestinationFolder) -ItemType Directory -Force
    }
    $LoggingPS1 = Invoke-WebRequest "https://raw.githubusercontent.com/Bazzu85/Bazzu-Powershell-Library/master/public/Logging/Logging.ps1"
    $LoggingDestinationFile = "$LoggingDestinationFolder\Logging.ps1"
    Add-content $LoggingDestinationFile -value $LoggingPS1

    # Get the configuration manager functions
    $ConfigurationManagerDestinationFolder = "$SRCFolder\Configuration Manager"
    if (!(Test-Path -LiteralPath $ConfigurationManagerDestinationFolder)){
        New-Item -Path ($ConfigurationManagerDestinationFolder) -ItemType Directory -Force
    }
    $ConfigurationManagerPS1 = Invoke-WebRequest "https://raw.githubusercontent.com/Bazzu85/Bazzu-Powershell-Library/master/public/Configuration%20Manager/Configuration%20Manager.ps1"
    $ConfigurationManagerDestinationFile = "$ConfigurationManagerDestinationFolder\Configuration Manager.ps1"
    Add-content $ConfigurationManagerDestinationFile -value $ConfigurationManagerPS1

    
}