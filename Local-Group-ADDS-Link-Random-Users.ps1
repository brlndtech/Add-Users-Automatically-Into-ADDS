#####  
if (Get-Module -ListAvailable -Name NTFSSecurity) {
    Write-Output "Module NTFSSecurity exists"
} 
else {
    Write-Output "Module does not exist, If you ware connected to the internet, I will try to downoad and install the following module : NTFSSecurity"
    Install-Module NTFSSecurity
}
<#
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

foreach ($partage in $partages) 
{
    New-Item -path "c:\" -Name "Partage" -ItemType directory | Out-Null # création du dossier Partage dans c:\
    

    foreach($rightType in $rightTypes)
    {
       $groupName0 = "DL-$($partage)-$($rightType)"
       Write-Host $groupName0
       New-ADGroup -Name "$groupName0" -GroupScope DomainLocal -GroupCategory Security -Path "ou=Locaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
    }
}

foreach ($partage in $partages) 
{
    foreach ($rootSite in $rootSites) 
    {
        New-Item -path "c:\Partage\" -Name "Sites" -ItemType directory | Out-Null # création du sous dossier Sites dans c:\
        
        foreach($rightType in $rightTypes)
        {
           $groupName0 = "DL-$($partage)-$($rootSites)-$($rightType)"
           Write-Host $groupName0
           New-ADGroup -Name "$groupName0" -GroupScope DomainLocal -GroupCategory Security -Path "ou=Locaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
        }
    }
}

foreach ($partage in $partages) 
{
    foreach ($rootSite in $rootSites) 
    {
        foreach ($site in $sites) # DL-Partage-Site-Paris-CT LM L
        {
            New-Item -path "c:\Partage\Sites" -Name "$site" -ItemType directory | Out-Null # création des sous dossier dans c:\
            

            foreach($rightType in $rightTypes)
            {
               $groupName1 = "DL-$($partage)-$($rootSite)-$($site)-$($rightType)"
               Write-Host $groupName1
               New-ADGroup -Name "$groupName1" -GroupScope DomainLocal -GroupCategory Security -Path "ou=Locaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
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
                New-Item -path "c:\Partage\Sites\$site" -Name "$service" -ItemType directory | Out-Null # création des sous dossier dans c:\
             

                foreach($rightType in $rightTypes)
                {
                   $groupName2 = "DL-$($partage)-$($rootSite)-$($site)-$($service)-$($rightType)"
                   Write-Host $groupName2
                   New-ADGroup -Name "$groupName2" -GroupScope DomainLocal -GroupCategory Security -Path "ou=Locaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
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

                New-Item -path "c:\Partage\Sites\$site\$service" -Name "$folder" -ItemType directory | Out-Null # création des sous dossier dans c:\

                    foreach($rightType in $rightTypes)
                    {
                        $groupName3 = "DL-$($partage)-$($rootSite)-$($site)-$($service)-$($folder)-$($rightType)"
                        Write-Host $groupName3
                        New-ADGroup -Name "$groupName3" -GroupScope DomainLocal -GroupCategory Security -Path "ou=Locaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
                    }
                }
            }
        }
    }
}
