# 1. Küsi andmed
$eesnimi = Read-Host "Sisesta eesnimi"
$perenimi = Read-Host "Sisesta perenimi"

# 2. Loo muutujad (ees.perenimi ja väiketähed)
$kasutajaNimi = "$eesnimi.$perenimi".ToLower()
$taisNimi = "$eesnimi $perenimi"
$parool = "Parool1!"

# 3. & 4. Kasutaja loomine ADSI abil (töötab igas Windowsis)
Write-Host "Proovin luua kasutajat: $kasutajaNimi..."

try {
    # Ühendume lokaalse arvutiga
    $arvuti = [ADSI]"WinNT://$env:COMPUTERNAME"
    
    # Kontrollime esmalt, kas kasutaja on juba olemas
    $kontroll = $arvuti.Children | Where-Object { $_.SchemaClassName -eq 'user' -and $_.Name -eq $kasutajaNimi }
    
    if ($kontroll) {
        Write-Host "Viga: Kasutaja '$kasutajaNimi' on juba süsteemis olemas." -ForegroundColor Yellow
    } else {
        # Loome uue kasutaja objekti
        $uusKasutaja = $arvuti.Create("user", $kasutajaNimi)
        $uusKasutaja.SetPassword($parool)
        $uusKasutaja.Put("Fullname", $taisNimi)
        $uusKasutaja.Put("Description", "Lokaalne kasutaja: $taisNimi")
        $uusKasutaja.SetInfo() # Salvestame muudatused
        
        # Kontrollime õnnestumist $? abil
        if ($?) {
            Write-Host "Kasutaja '$kasutajaNimi' loomine õnnestus!" -ForegroundColor Green
        }
    }
}
catch {
    Write-Host "Viga: Kasutaja loomine ebaõnnestus süsteemse vea tõttu." -ForegroundColor Red
    Write-Host $_.Exception.Message
}