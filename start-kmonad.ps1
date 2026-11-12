<#
.SYNOPSIS
    Starts KMonad with the local configuration file on Windows.

.PARAMETER Background
    If specified, runs KMonad in the background as a hidden process.

.PARAMETER ConfigPath
    Path to the .kbd configuration file (defaults to config.kbd).
#>

[CmdletBinding()]
param (
    [switch]$Background,
    [string]$ConfigPath = "$PSScriptRoot\config.kbd"
)

$kmonadCmd = Get-Command "kmonad.exe" -ErrorAction SilentlyContinue
$kmonadExe = if ($kmonadCmd) {
    $kmonadCmd.Source
} elseif (Test-Path "$PSScriptRoot\kmonad.exe") {
    "$PSScriptRoot\kmonad.exe"
} else {
    $null
}

if (-not $kmonadExe) {
    Write-Error @"
[ERROR] kmonad.exe was not found in PATH or in $PSScriptRoot.

To download KMonad for Windows:
  1. Visit: https://github.com/kmonad/kmonad/releases
  2. Download the Windows binary (kmonad.exe).
  3. Place it in this folder ($PSScriptRoot) or in your system PATH.
"@
    exit 1
}

if (-not (Test-Path $ConfigPath)) {
    Write-Error "[ERROR] Configuration file '$ConfigPath' not found."
    exit 1
}

Write-Host "Found KMonad binary at: $kmonadExe" -ForegroundColor Cyan
Write-Host "Using configuration:   $ConfigPath" -ForegroundColor Cyan

if ($Background) {
    Write-Host "Starting KMonad in background..." -ForegroundColor Green
    Start-Process -FilePath $kmonadExe -ArgumentList "`"$ConfigPath`"" -WindowStyle Hidden
    Write-Host "KMonad started in the background. To stop it, run: Stop-Process -Name kmonad" -ForegroundColor Yellow
} else {
    Write-Host "Starting KMonad in foreground (Press Ctrl+C to stop)..." -ForegroundColor Green
    & $kmonadExe "$ConfigPath"
}
