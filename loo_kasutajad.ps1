# 1. Funktsioon täpitähtede asendamiseks
function Convert-LatinChars {
    param([string]$text)
   $replaceTable = @{ 'õ'='o'; 'ä'='a'; 'ö'='o'; 'ü'='u'; 'š'='s'; 'ž'='z' }
    $outputText = ""
    
    $text.ToCharArray() | ForEach-Object {
        if ($replaceTable.ContainsKey($_)) { $outputText += $replaceTable[$_] }
        else { $outputText += $_ }
    }
    return $outputText.ToLower()
}

# 2. CSV faili importimine (veendu, et tee on õige)
$users = Import-Csv "C:\Users\Administrator\Desktop\adkasutajad.csv"

foreach ($user in $users) {
    # Kasutajanime puhastamine täpitähtedest
    $cleanFirstName = Convert-LatinChars $user.FirstName
    $sName = $user.SamAccountName # Või kasuta $cleanFirstName kui soovid genereerida
    
    # Parooli ettevalmistamine
    $securePass = ConvertTo-SecureString $user.Password -AsPlainText -Force
    
    # Kasutaja loomine
    New-ADUser -Name "$($user.FirstName) $($user.LastName)" `
               -GivenName $user.FirstName `
               -Surname $user.LastName `
               -SamAccountName $sName `
               -UserPrincipalName "$sName@sv-kool.local" `
               -AccountPassword $securePass `
               -Department $user.Department `
               -Enabled $true
               
    Write-Host "Kasutaja $sName on loodud!" -ForegroundColor Green
}
