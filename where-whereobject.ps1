# i. Find Notepad PIDs
Get-Process -Name notepad | Select-Object ProcessName, Id

# ii. File Management 
$path = "C:\Temp\Test"
Write-Host "`nTotal files in folder:"
(Get-ChildItem -Path $path).Count

# Find CSV and display size in KB and MB
Get-ChildItem -Path $path -Filter *.csv | Select-Object Name, 
    @{Name="Size(KB)"; Expression={$_.Length / 1KB}}, 
    @{Name="Size(MB)"; Expression={$_.Length / 1MB}}