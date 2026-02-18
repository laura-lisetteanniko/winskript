Write-Host "Monitoring Notepad... Close all instances to stop." -ForegroundColor Cyan

# The loop continues as long as Get-Process finds 'notepad'
while (Get-Process -Name notepad -ErrorAction SilentlyContinue) {
    Write-Host "Notepad is running"
}

Write-Host "All Notepad instances closed. Loop ended." -ForegroundColor Red