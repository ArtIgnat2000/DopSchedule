param(
    [int]$Port = 8000
)

$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

if (Get-Command python -ErrorAction SilentlyContinue) {
    Write-Host "Starting Python http.server on port $Port ..."
    python -m http.server $Port
} elseif (Get-Command python3 -ErrorAction SilentlyContinue) {
    Write-Host "Starting Python3 http.server on port $Port ..."
    python3 -m http.server $Port
} else {
    Write-Host "Python not found. Install Python 3 or use: npx http-server -p $Port"
}
