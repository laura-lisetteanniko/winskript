$Array1 = @(1, 2, 3)
$Array2 = @(4, 5, 6)

$Array3 = @()

$Array3 += ($Array1[0] + $Array2[0])

$Array3 += ($Array1[1] + $Array2[1])

$Array3 += ($Array1[2] + $Array2[2])

Write-Host "The 3rd array values are:" -ForegroundColor Cyan
$Array3