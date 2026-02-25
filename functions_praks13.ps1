# --- FUNCTIONS ---

function Show-MainMenu {
    do {
        # Clear-Host wipes the screen so previous menus 'disappear'
        Clear-Host 
        Write-Host "--- MAIN MENU ---" -ForegroundColor Cyan
        Write-Host "1. Sub-Menu Options"
        Write-Host "2. Exit"
        
        $choice = Read-Host "`nSelect an option"

        switch ($choice) {
            "1" { Show-SubMenu }
            "2" { exit }
            Default { 
                Write-Host "Incorrect entry, please try again." -ForegroundColor Red
                Start-Sleep -Seconds 1 
            }
        }
    } while ($choice -ne "2")
}

function Show-SubMenu {
    Clear-Host
    Write-Host "--- SUB MENU ---" -ForegroundColor Yellow
    
    # Example task: Performing the service count from Practice 12
    $running = (Get-Service | Where-Object Status -eq "Running").Count
    Write-Host "Action performed: There are currently $running services running."

    $valid = $false
    while (-not $valid) {
        Write-Host "`n--------------------------------"
        Write-Host "1. Back to Main Menu"
        Write-Host "2. Exit Script"
        
        $subChoice = Read-Host "Selection"

        if ($subChoice -eq "1") {
            $valid = $true # This breaks the sub-menu loop and returns to Main Menu
        }
        elseif ($subChoice -eq "2") {
            exit
        }
        else {
            Write-Host "Entry is incorrect. Please re-enter the option." -ForegroundColor Red
        }
    }
}

# --- EXECUTION ---
Show-MainMenu