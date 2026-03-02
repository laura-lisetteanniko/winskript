# 1. Kasutajalt faili tee küsimine
$FailiTee = Read-Host "Sisesta CSV-faili täis-tee (nt C:\Temp\kasutajad.csv)"

# Kontroll, kas fail on olemas
if (-not (Test-Path $FailiTee)) {
    Write-Host "VIGA: Faili '$FailiTee' ei leitud! Palun kontrolli asukohta." -ForegroundColor Red
    exit
}

Write-Host "--- Protsess algas ---" -ForegroundColor Cyan

# 2. Andmete importimine CSV-st (eeldab semikoolonit eraldajana)
$Kasutajad = Import-Csv -Path $FailiTee -Delimiter ";"

# Massiiv tulemuste salvestamiseks, et neid lõpus kuvada
$Tulemused = @()

# 3. Tsükkel kasutajate loomiseks
foreach ($Rida in $Kasutajad) {
    $Nimi = $Rida.Nimi
    $Taisnimi = $Rida.Taisnimi
    $ParoolTekstina = $Rida.Parool

    # Kontrollime, kas kasutaja on juba olemas
    if (Get-LocalUser -Name $Nimi -ErrorAction SilentlyContinue) {
        Write-Host "[-] Kasutaja '$Nimi' on juba olemas. Jätan vahele." -ForegroundColor Yellow
    }
    else {
        try {
            # Parooli konverteerimine turvaliseks stringiks
            $TurvalineParool = ConvertTo-SecureString $ParoolTekstina -AsPlainText -Force
            
            # Uue kasutaja loomine
            $UusKasutaja = New-LocalUser -Name $Nimi `
                                         -Password $TurvalineParool `
                                         -FullName $Taisnimi `
                                         -Description "Loodud skriptiga $(Get-Date -Format 'g')" `
                                         -ErrorAction Stop
            
            Write-Host "[+] Kasutaja '$Nimi' loodud!" -ForegroundColor Green
            $Tulemused += $UusKasutaja
        }
        catch {
            Write-Host "[!] Viga kasutaja '$Nimi' loomisel: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
}

Write-Host "--- Töö lõpetatud ---" -ForegroundColor Cyan

# 4. Kuva loodud kasutajate nimekiri (nagu sinu pildil)
if ($Tulemused) {
    $Tulemused | Select-Object Name, Enabled, Description | Format-Table -AutoSize
}