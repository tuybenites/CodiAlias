<#
.SYNOPSIS
    Copies all files from .\scripts directory to a destination directory.
    After the files are copied, the "code" command (exclusive to VSCode)
    becomes executable, creating an alias for the "codium" command.

.DESCRIPTION
    This script does not check if the source exists, as it is not necessary, but it always
    checks if the destination exists and if it is a valid directory.
    If valid, it copies all files from the source directory to the destination directory.

.PARAMETER Destination
    The path to the destination directory where files will be copied.

.PARAMETER Default
    A flag that sets the destination to the default VSCodium directory. If a different
    destination is provided along with the flag, it will be overwritten by the default
    destination, and the files will be copied to that directory.

.EXAMPLE
    .\Copy-Files.ps1 -Destination C:\destination\path
    .\Copy-Files.ps1 -default
#>

param (
    [string] $Destination,
    [switch] $Default
)

$SCRIPTS_FOLDER = ".\scripts"

function Copy-Files {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Source,

        [Parameter(Mandatory = $true)]
        [string]$Destination
    )

    if (-Not (Get-Item $Source).PSIsContainer) {
        Write-Error "Source path '$Source' is not a directory."
        return
    }

    if (-Not (Test-Path -Path $Destination)) {
        Write-Error "Destination directory '$Destination' does not exist."
        return
    }

    Write-Host "Copying files from '$Source' to '$Destination'..." -ForegroundColor Cyan
    Get-ChildItem -Path $Source -File | ForEach-Object {
        $DestinationPath = Join-Path -Path $Destination -ChildPath $_.Name
        Copy-Item -Path $_.FullName -Destination $DestinationPath -Force
        Write-Host "Copied: $($_.Name)" -ForegroundColor Green
    }
    Write-Host "All files copied successfully." -ForegroundColor Yellow
}

try {
    if ($Default) {
        $DefaultDestination = "$env:SystemDrive\Program Files\VSCodium\bin\"
        Copy-Files -Source $SCRIPTS_FOLDER -Destination $DefaultDestination
    }
    else {
        Copy-Files -Source $SCRIPTS_FOLDER -Destination $Destination
    }
}
catch {
    Write-Error "An error occurred: $_"
}
