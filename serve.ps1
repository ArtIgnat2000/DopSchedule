param(
    [int]$Port = 8000
)

# Простая обёртка для python -m http.server
# Использование: .\serve.ps1 8000

function Test-Python {
    try {
        $py = Get-Command python -ErrorAction Stop
        return $true
    } catch {
        return $false
    }
}

if (Test-Python) {
    Write-Host "Запускаю Python HTTP сервер на порту $Port..." -ForegroundColor Green
    python -m http.server $Port
} else {
    Write-Host "Python не найден в PATH. Установите Python 3 или используйте Node.js http-server или VS Code Live Server." -ForegroundColor Yellow
    Write-Host "Ссылка на загрузку Python: https://www.python.org/downloads/"
}
