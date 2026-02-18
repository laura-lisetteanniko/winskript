$counter = 0

do {
    Write-Host "Notepad is running"
    $counter++
    Start-Sleep -Seconds 1
} 
# The loop stops when this condition is TRUE (i.e., when notepad is NOT found)
until (-not (Get-Process -Name notepad -ErrorAction SilentlyContinue))

Write-Host "Total intervals displayed (Until loop): $counter" -ForegroundColor Green