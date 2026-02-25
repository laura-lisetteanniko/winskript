$num1 = [double](Read-Host "Enter first number")
$num2 = [double](Read-Host "Enter second number")

Write-Host "`n1. Add`n2. Subtract`n3. Multiply`n4. Divide"
$choice = Read-Host "Choose an action"

switch ($choice) {
    1 { $num1 + $num2 }
    2 { $num1 - $num2 }
    3 { $num1 * $num2 }
    4 { if($num2 -ne 0){$num1 / $num2} else{"Cannot divide by zero"} }
    Default { "Invalid choice" }
}