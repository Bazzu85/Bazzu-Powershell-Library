Function CheckDirectories (){
    [CmdletBinding()] param(
        [Parameter()]
        [string] $mainScriptPath= $(throw "Script path is mandatory ($($MyInvocation.MyCommand) function).")
    )
    if (!(Test-Path -LiteralPath "$mainScriptPath\configuration")){
        New-Item -Path ("$mainScriptPath\configuration") -ItemType Directory -Force
    }
    if (!(Test-Path -LiteralPath "$mainScriptPath\log")){
        New-Item -Path ("$mainScriptPath\log") -ItemType Directory -Force
    }
}

Function CreateMissingFolder (){
    [CmdletBinding()] param(
        [Parameter()]
        [string] $FolderToCreate= $(throw "Folder path is mandatory ($($MyInvocation.MyCommand) function).")
    )
    if (!(Test-Path -LiteralPath $FolderToCreate)){
        New-Item -Path ($FolderToCreate) -ItemType Directory -Force
    }
}
