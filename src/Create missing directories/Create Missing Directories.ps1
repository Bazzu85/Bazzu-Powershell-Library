Function CheckDirectories (){
    [CmdletBinding()] param(
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string] $mainScriptPath= $(throw "Script path is mandatory ($($MyInvocation.MyCommand) function).")
    )
    if (!(Test-Path -LiteralPath "$mainScriptPath\configuration")){
        New-Item -Path ("$mainScriptPath\configuration") -ItemType Directory -Force
    }
    if (!(Test-Path -LiteralPath "$mainScriptPath\log")){
        New-Item -Path ("$mainScriptPath\log") -ItemType Directory -Force
    }
}