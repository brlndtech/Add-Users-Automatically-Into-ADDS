######################################################
#                       PYAD                         #
#          People Your Active Directory              #
#          ** scripts by brlndtech **                #
#      github : https://github.com/brlndtech         #
#            Please RTFM README.md                   #
#                        V6                          #
######################################################

######################################################

# Basic Department : Info,Compta,Juridique (user-random.csv)
# Services de base : Paris, Lyon, Marseille (user-random.csv)

# Basic geographic site: Paris, Lyon, Marseille (user-random.csv)
# Site géographique de base : Paris, Lyon, Marseille (user-random.csv)

Import-Module ActiveDirectory
Import-Module 'Microsoft.PowerShell.Security'
Clear-Host
Write-Host "*********************************"
Write-Host "*             PYAD              *"
Write-Host "* People Your Active Directory  *"
Write-Host "*   ~ scripts by brlndtech ~    *"
Write-Host "*     Please RTFM README.md     *"
Write-Host "*        V7 - Stable            *"
Write-Host "*********************************"
Write-Host ""
Write-Host ""
$a = 1
while ($a -eq 1) {
Write-Host "1) Deploy an non-custom ADDS Tree"
Write-Host "2) Deploy a custom ADDS Tree (3 specific sites and services)"
Write-Host "3) Create ONLY local groups for the services (after option 1) or 2))"
Write-Host "4) End"
$answer=Read-Host "Answer "
    switch ($answer)
    {
        1 {

        $site1="Paris"
        $site2="Lyon"
        $site3="Marseille"

        $service1="ComputerScience"
        $service2="Accounting"
        $service3="Juridical"

        . '.\ADDS-Add-Random-Users.ps1'
        Write-Host ""
        Write-Host "I Hope that the program has runed good for you (:"
        pause
        Clear-Host
        }
        2 {
    
        $site1=Read-Host "Enter the name of your first site "
        $site2=Read-Host "Enter the name of your second site "
        $site3=Read-Host "Enter the name of your third site "

        $service1=Read-Host "Enter the name of your first service "
        $service2=Read-Host "Enter the name of your second service "
        $service3=Read-Host "Enter the name of your third service "

        (Get-Content -Path .\users-random.csv) |
        ForEach-Object {$_ -Replace 'Lyon', $site1} |
        Set-Content -Path .\users-random.csv
        Get-Content -Path .\users-random.csv

        (Get-Content -Path .\users-random.csv) |
        ForEach-Object {$_ -Replace 'Marseille', $site2} |
        Set-Content -Path .\users-random.csv
        Get-Content -Path .\users-random.csv

        (Get-Content -Path .\users-random.csv) |
        ForEach-Object {$_ -Replace 'Paris', $site3} |
        Set-Content -Path .\users-random.csv
        Get-Content -Path .\users-random.csv

        (Get-Content -Path .\users-random.csv) |
        ForEach-Object {$_ -Replace 'ComputerScience', $service1} |
        Set-Content -Path .\users-random.csv
        Get-Content -Path .\users-random.csv

        (Get-Content -Path .\users-random.csv) |
        ForEach-Object {$_ -Replace 'Accounting', $service2} |
        Set-Content -Path .\users-random.csv
        Get-Content -Path .\users-random.csv

        (Get-Content -Path .\users-random.csv) |
        ForEach-Object {$_ -Replace 'Juridical', $service3} |
        Set-Content -Path .\users-random.csv
        Get-Content -Path .\users-random.csv

        # le changement des sites / services a été éfféctué dans le fichier .csv, maintenant, nous apellons le script principal :) 

        . '.\ADDS-Add-Random-Users.ps1'

        # et on maintenant on remet le fichier .csv comme avant (avec les sites géographiques/ services par défaut)


        (Get-Content -Path .\users-random.csv) |
        ForEach-Object {$_ -Replace $site1, 'Paris' } |
        Set-Content -Path .\users-random.csv
        Get-Content -Path .\users-random.csv

        (Get-Content -Path .\users-random.csv) |
        ForEach-Object {$_ -Replace $site2, 'Lyon' } |
        Set-Content -Path .\users-random.csv
        Get-Content -Path .\users-random.csv

        (Get-Content -Path .\users-random.csv) |
        ForEach-Object {$_ -Replace $site3, 'Marseille' } |
        Set-Content -Path .\users-random.csv
        Get-Content -Path .\users-random.csv

        (Get-Content -Path .\users-random.csv) |
        ForEach-Object {$_ -Replace $service1, 'ComputerScience' } |
        Set-Content -Path .\users-random.csv
        Get-Content -Path .\users-random.csv

        (Get-Content -Path .\users-random.csv) |
        ForEach-Object {$_ -Replace $service2, 'Accounting' } |
        Set-Content -Path .\users-random.csv
        Get-Content -Path .\users-random.csv

        (Get-Content -Path .\users-random.csv) |
        ForEach-Object {$_ -Replace $service3, 'Juridical' } |
        Set-Content -Path .\users-random.csv
        Get-Content -Path .\users-random.csv

        Write-Host ""
        Write-Host "I Hope that the program has runed good for you (:"
        pause
        Clear-Host
    
        }
        default {
        Clear-Host
        Write-Host "Please, dont be a chill :( "
        Start-Sleep -Seconds 1.2
        Clear-Host
        $a = 1
        }
        3 {
        . '.\Local-Group-ADDS-Link-Random-Users.ps1'
        pause
        Clear-Host
        }
        4 {
        $a = 0
        Clear-Host
        }
    }
}