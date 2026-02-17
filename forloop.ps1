$colors = "Red", "Green", "Yellow", "Blue"
$groupList = @()

for ($i = 1; $i -le 20; $i++) {
    
    $randomColor = $colors | Get-Random
    
    $studentGroup = [PSCustomObject]@{
        RollNumber = $i
        Group      = $randomColor
    }
    
    $groupList += $studentGroup
}

$groupList | Format-Table -AutoSize