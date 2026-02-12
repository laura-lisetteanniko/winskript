$DaysWorkedTable = @{
    "John" = 12
    "Joe"  = 20
    "Mary" = 18
}

$SalaryPerDayTable = @{
    "John" = 100
    "Joe"  = 120
    "Mary" = 150
}

$SalaryTable = @{}

foreach ($Name in $DaysWorkedTable.Keys) {
    $Days = $DaysWorkedTable[$Name]
    $Rate = $SalaryPerDayTable[$Name]

    $SalaryTable[$Name] = $Days * $Rate
}

$SalaryTable