# i. Function without parameters
function Get-ServiceCounts {
    $running = (Get-Service | Where-Object Status -eq "Running").Count
    $stopped = (Get-Service | Where-Object Status -eq "Stopped").Count
    Write-Host "Running: $running, Stopped: $stopped"
}

# ii. Function with parameters
function Get-ServiceByStatus {
    param([string]$Status)
    $count = (Get-Service | Where-Object Status -eq $Status).Count
    return $count
}

# Usage:
Get-ServiceCounts
$runCount = Get-ServiceByStatus -Status "Running"
Write-Host "Running count via parameter: $runCount"