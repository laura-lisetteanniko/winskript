# i. Find Notepad PIDs
Get-Process -Name notepad | Select-Object ProcessName, Id

# ii. File Management
New-Item -Path "C:\Temp\Test" -ItemType Directory -Force
# (Assuming files are already placed there)

# Show total files
Write-Host "Total files in folder:"
(Get-ChildItem -Path "C:\Temp\Test").Count

# Find CSV and display size
Get-ChildItem -Path "C:\Temp\Test" -Filter *.csv | Select-Object Name, 
    @{Name="Size(KB)"; Expression={$_.Length / 1KB}}, 
    @{Name="Size(MB)"; Expression={$_.Length / 1MB}}