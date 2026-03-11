# 1. Küsi kasutaja andmed
$eesnimi = Read-Host -Prompt "Sisesta kustutatava kasutaja eesnimi"
$perenimi = Read-Host -Prompt "Sisesta kustutatava kasutaja perenimi"

# 2. Loo kasutajanimi (standard: eesnimi.perenimi väiketähtedes)
$kasutajanimi = "$($eesnimi)$($perenimi)".ToLower()

# 3. & 4. Proovi kasutajat kustutada ja hallata vigu
# Kasutame -ErrorAction SilentlyContinue, et peita punased süsteemsed veateated
try {
    # Kontrollime, kas lokaalne kasutaja on olemas
    $kasutajaOlemas = Get-LocalUser -Name $kasutajanimi -ErrorAction SilentlyContinue

    if ($kasutajaOlemas) {
        Remove-LocalUser -Name $kasutajanimi -ErrorAction Stop
        Write-Host "Edu: Kasutaja '$kasutajanimi' on edukalt süsteemist eemaldatud." -ForegroundColor Green
    } else {
        Write-Host "Viga: Kasutajat nimega '$kasutajanimi' ei leitud." -ForegroundColor Yellow
    }
}
catch {
    # Kui tekib ootamatu viga (nt õiguste puudumine)
    Write-Host "Viga: Kasutaja '$kasutajanimi' kustutamine ebaõnnestus. Teade: $($_.Exception.Message)" -ForegroundColor Red
}