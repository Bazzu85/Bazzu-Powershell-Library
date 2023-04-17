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

    # Get the logging functions
    $LoggingDestinationFolder = "$SRCFolder\Logging"
    if (!(Test-Path -LiteralPath $LoggingDestinationFolder)){
        New-Item -Path ($LoggingDestinationFolder) -ItemType Directory -Force
    }
    $LoggingPS1 = Invoke-WebRequest "https://raw.githubusercontent.com/Bazzu85/Bazzu-Powershell-Library/master/src/Logging/Logging.ps1"
    $LoggingDestinationFile = "$LoggingDestinationFolder\Logging.ps1"
    $LoggingPS1Local = Get-Content $LoggingDestinationFile
    if ($LoggingPS1 -ne $LoggingPS1Local){
        Add-content $LoggingDestinationFile -value $LoggingPS1
    }
}