######################################################
#        CREATE AND POPULATE YOUR ADDS               #
#          **A script by brlndtech **                #
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
Write-Host "* CREATE AND POPULATE YOUR ADDS *"
Write-Host "*   ~ A script by brlndtech ~   *"
Write-Host "*     Please RTFM README.md     *"
Write-Host "*        V7 - Stable            *"
Write-Host "*********************************"
Write-Host ""
Write-Host "1) Use the default option for deploy an non-custom ADDS Tree"
Write-Host "2) Use this option if you want to custom 3 specific sites and services"
Write-Host ""
$a = 1
while ($a -eq 1) {
$answer=Read-Host "Answer "
    switch ($answer)
    {
        1 {

        $site1="Paris"
        $site2="Lyon"
        $site3="Marseille"

        $service1="Info"
        $service2="Compta"
        $service3="Juridique"

        . '.\ADDS-Add-Random-Users-V7.ps1'
        $a = 0
        }
        2 {
    
        $site1=Read-Host "Enter the name of your first site "
        $site2=Read-Host "Enter the name of your second site "
        $site3=Read-Host "Enter the name of your third site "

        $service1=Read-Host "Enter the name of your first service "
        $service2=Read-Host "Enter the name of your second service "
        $service3=Read-Host "Enter the name of your third service "

        (Get-Content -Path .\users-random.csv) |
        ForEach-Object {$_ -Replace 'Paris', $site1} |
        Set-Content -Path .\users-random.csv
        Get-Content -Path .\users-random.csv

        (Get-Content -Path .\users-random.csv) |
        ForEach-Object {$_ -Replace 'Lyon', $site2} |
        Set-Content -Path .\users-random.csv
        Get-Content -Path .\users-random.csv

        (Get-Content -Path .\users-random.csv) |
        ForEach-Object {$_ -Replace 'Marseille', $site3} |
        Set-Content -Path .\users-random.csv
        Get-Content -Path .\users-random.csv

        (Get-Content -Path .\users-random.csv) |
        ForEach-Object {$_ -Replace 'Info', $service1} |
        Set-Content -Path .\users-random.csv
        Get-Content -Path .\users-random.csv

        (Get-Content -Path .\users-random.csv) |
        ForEach-Object {$_ -Replace 'Compta', $service2} |
        Set-Content -Path .\users-random.csv
        Get-Content -Path .\users-random.csv

        (Get-Content -Path .\users-random.csv) |
        ForEach-Object {$_ -Replace 'Juridique', $service3} |
        Set-Content -Path .\users-random.csv
        Get-Content -Path .\users-random.csv

        # le changement des sites / services a été éfféctué dans le fichier .csv, maintenant, nous apellons le script principal :) 

        . '.\ADDS-Add-Random-Users-V7.ps1'

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
        ForEach-Object {$_ -Replace $service1, 'Info' } |
        Set-Content -Path .\users-random.csv
        Get-Content -Path .\users-random.csv

        (Get-Content -Path .\users-random.csv) |
        ForEach-Object {$_ -Replace $service2, 'Compta' } |
        Set-Content -Path .\users-random.csv
        Get-Content -Path .\users-random.csv

        (Get-Content -Path .\users-random.csv) |
        ForEach-Object {$_ -Replace $service3, 'Juridique' } |
        Set-Content -Path .\users-random.csv
        Get-Content -Path .\users-random.csv

        $a = 0
    
        }
        default {
        Clear-Host
        Write-Host "Please, dont be a chill :( "
        Write-Host "1) Use the default option for deploy an non-custom ADDS Tree"
        Write-Host "2) Use this option if you want to custom 3 specific sites and services"
        $a = 1
        }
    }
}
Write-Host ""
Write-Host "I Hope that the program has runed good for you (:"
pause
Write-Host ""