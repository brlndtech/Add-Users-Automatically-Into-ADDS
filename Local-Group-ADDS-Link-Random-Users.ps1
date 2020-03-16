﻿<#
Exemple d'arborescence pour le site de Paris 
- Partage
    - Sites 
        - Paris
            - Info
                - Commun 
                - Data 
            - Accounting
                - Commun 
                - Data
            - Juridical
                - Commun
                - Data 
        - Lyon (...)
        - Marseille (...)

#>
# Création de trois groupe de domaines globaux avec suffixage  CT,LM,L pour chaque dossiers. 
$partages = @("Partage")
$rootSites = @("Sites")
$sites = @("$site1", "$site2", "$site3") # villes 
$services = @("$service1","$service2","$service3") #services 
$folders = @("Commun", "Data") # shared folder into services/ direction/ ... 
# $subfolder = @("Commun", "Data")
$rightTypes = @("CT", "LM", "R") # permissions 

$answer=Read-Host "L'aborescence du script ADDS Add Random User a été crée  ? (O/N)"
If ($answer -eq "N") {

    New-ADOrganizationalUnit -Name "Sites" -Path "dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "Groupes" -Path "ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "Globaux" -Path "ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "Locaux" -Path "ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"

}

foreach ($partage in $partages) 
{
    foreach($rightType in $rightTypes)
    {
       $groupName0 = "DL-$($partage)-$($rightType)"
       Write-Host $groupName0
       New-ADGroup -Name "$groupName0" -GroupScope DomainLocal -GroupCategory Security -Path "ou=Locaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
       Write-Host "Creating $($groupName0)"
    }
}

foreach ($partage in $partages) 
{
    foreach ($rootSite in $rootSites) 
    {
        foreach ($site in $sites) # DL-Partage-Site-Paris-CT LM L
        {
            foreach($rightType in $rightTypes)
            {
               $groupName1 = "DL-$($partage)-$($rootSite)-$($site)-$($rightType)"
               Write-Host $groupName1
               New-ADGroup -Name "$groupName1" -GroupScope DomainLocal -GroupCategory Security -Path "ou=Locaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
               Write-Host "Creating $($groupName1)"
            }
        }
    }

}

foreach ($partage in $partages)
{
    foreach ($rootSite in $rootSites) 
    {
        foreach ($site in $sites) # DL_Partage_Paris,Lyon,Marseille[SERVICES...]CT-LM-L
        {
            foreach($service in $services)
            {
                foreach($rightType in $rightTypes)
                {
                   $groupName2 = "DL-$($partage)-$($rootSite)-$($site)-$($service)-$($rightType)"
                   Write-Host $groupName2
                   New-ADGroup -Name "$groupName2" -GroupScope DomainLocal -GroupCategory Security -Path "ou=Locaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
                   Write-Host "Creating $($groupName2)"
               }
            }
        }
    }
}

foreach ($partage in $partages) 
{
    foreach ($rootSite in $rootSites) 
    {
        foreach ($site in $sites)  # DL_Partage_Paris,Lyon,Marseille[SERVICES...][DOSSIERS...]CT-LM-L
        {
            foreach($service in $services)
            {
                foreach($folder in $folders)
                {
                    foreach($rightType in $rightTypes)
                    {
                        $groupName3 = "DL-$($partage)-$($rootSite)-$($site)-$($service)-$($folder)-$($rightType)"
                        Write-Host $groupName3
                        New-ADGroup -Name "$groupName3" -GroupScope DomainLocal -GroupCategory Security -Path "ou=Locaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
                        Write-Host "Creating $($groupName3)"
                    }
                }
            }
        }
    }
}