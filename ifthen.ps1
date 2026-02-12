Write-Host "--- OSA 1: Arvude Võrdlemine ---" -ForegroundColor Cyan

$num1 = [double](Read-Host "Sisestage esimene arv")
$num2 = [double](Read-Host "Sisestage teine arv")

if ($num1 -gt $num2) {
    Write-Host "The higher number is : $num1" -ForegroundColor Yellow
} elseif ($num2 -gt $num1) {
    Write-Host "The higher number is : $num2" -ForegroundColor Yellow
} else {
    Write-Host "Mõlemad arvud on võrdsed." -ForegroundColor Yellow
}

Write-Host "'n"

Write-Host "--- OSA 2: Riikide pealinnad ---" -ForegroundColor Cyan
Write-Host "1. Estonia"
Write-Host "2. Latvia"
Write-Host "3. Lithuania"
Write-Host "4. Finland"

$choice = Read-Host "Valige riigi number (1-4)"

switch ($choice) {
    "1" { Write-Host "The capital of Estonia is Tallinn. -ForegroundColor Green }
    "2" { Write-Host "The capital of Latvia is Riga. -ForegroundColor Green }
    "3" { Write-Host "The capital of Lithuania is Vilnius. -ForegroundColor Green }
    "4" { Write-Host "The capital of Finland is Helsinki. -ForegroundColor Green }
    Default { Write-Host "Vigane valik! Palun vali arv 1 ja 4 vahel." -ForegroundColor Red }
}