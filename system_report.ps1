# 1. Kasutaja sisend
$userName = Read-Host "Sisestage oma nimi"
$countInput = Read-Host "Mitu korda tervitust kuvada?"

if ($countInput -match '^\d+$') {
    $count = [int]$countInput
} else {
    Write-Host "Viga: Sisestatud väärtus ei ole number. Kasutan vaikimisi väärtust 1." -ForegroundColor Red
    $count = 1
}

# Alustame väljundi kogumist faili jaoks
$reportPath = "report.txt"
$reportContent = @()

# 2. Tsükkel tervituste kuvamiseks
$greetingBlock = ""
for ($i = 1; $i -le $count; $i++) {
    $line = "Tere, $userName! ($i)"
    Write-Host $line
    $greetingBlock += $line + "`r`n"
}
$reportContent += $greetingBlock

# 3. Süsteemiinfo
$sysInfo = @"
--- SÜSTEEMI INFO ---
Kuupäev: $(Get-Date)
Arvuti nimi: $env:COMPUTERNAME
Sisselogitud kasutaja: $env:USERNAME
PowerShelli versioon: $($PSVersionTable.PSVersion)
"@
Write-Host $sysInfo
$reportContent += $sysInfo

# 4. Cmdlet’ide kasutamine (Protsessid ja teenused)
Write-Host "`nKuvame 3 töötavat protsessi ja teenust..."
$processes = Get-Process | Select-Object -First 3
$services = Get-Service | Select-Object -First 3 | Select-Object Name, Status

$reportContent += "`n--- PROTSESSID ---"
$reportContent += $processes | Out-String
$reportContent += "--- TEENUSED ---"
$reportContent += $services | Out-String

# Kuvame ka ekraanile
$processes
$services

# 5. Tingimuslause (v5 kontroll)
if ($PSVersionTable.PSVersion.Major -lt 5) {
    $verMessage = "HOIATUS: PowerShelli versioon on alla 5!"
    Write-Host $verMessage -ForegroundColor Yellow
} else {
    $verMessage = "PowerShelli versioon on sobiv ($($PSVersionTable.PSVersion.Major))."
    Write-Host $verMessage -ForegroundColor Green
}
$reportContent += "`n$verMessage"

# 6. Väljundi salvestamine faili
$reportContent | Out-File -FilePath $reportPath -Encoding utf8
Write-Host "`nRaport on salvestatud faili: $reportPath"

# 7. Vormindatud lõppteade
Write-Host "==========================="
Write-Host "Script finished successfully"
Write-Host "==========================="