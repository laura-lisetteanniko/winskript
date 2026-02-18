$counter = 0

do {
    Write-Host "Notepad is running"
    $counter++
    Start-Sleep -Seconds 1
} 
# The condition is checked AFTER the code runs once
while (Get-Process -Name notepad -ErrorAction SilentlyContinue)

Write-Host "Total intervals displayed: $counter" -ForegroundColor Green