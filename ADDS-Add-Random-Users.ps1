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

$users = Import-Csv -Delimiter ";" -Path "users-random.csv"


$netbios=Read-Host "Enter the netbios of your domain (ex : company) "
$domain=Read-Host "Enter the .tld (ex : com) "


    New-ADOrganizationalUnit -Name "Sites" -Path "dc=$netbios,dc=$domain"

    #******* $site1 *******
    New-ADOrganizationalUnit -Name "$site1" -Path "ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "Services" -Path "ou=$site1,ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "$service1" -Path "ou=Services,ou=$site1,ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "$service2" -Path "ou=Services,ou=$site1,ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "$service3" -Path "ou=Services,ou=$site1,ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "Materiels" -Path "ou=$site1,ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "Serveurs" -Path "ou=Materiels,ou=$site1,ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "PC" -Path "ou=Materiels,ou=$site1,ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "Imprimantes" -Path "ou=Materiels,ou=$site1,ou=Sites,dc=$netbios,dc=$domain"

    #******* $site2 *******
    New-ADOrganizationalUnit -Name "$site2" -Path "ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "Services" -Path "ou=$site2,ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "$service1" -Path "ou=Services,ou=$site2,ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "$service2" -Path "ou=Services,ou=$site2,ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "$service3" -Path "ou=Services,ou=$site2,ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "Materiels" -Path "ou=$site2,ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "Serveurs" -Path "ou=Materiels,ou=$site2,ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "PC" -Path "ou=Materiels,ou=$site2,ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "Imprimantes" -Path "ou=Materiels,ou=$site2,ou=Sites,dc=$netbios,dc=$domain"

    #******* $site3 *******
    New-ADOrganizationalUnit -Name "$site3" -Path "ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "Services" -Path "ou=$site3,ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "$service1" -Path "ou=Services,ou=$site3,ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "$service2" -Path "ou=Services,ou=$site3,ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "$service3" -Path "ou=Services,ou=$site3,ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "Materiels" -Path "ou=$site3,ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "Serveurs" -Path "ou=Materiels,ou=$site3,ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "PC" -Path "ou=Materiels,ou=$site3,ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "Imprimantes" -Path "ou=Materiels,ou=$site3,ou=Sites,dc=$netbios,dc=$domain"

    #******* Création des OU Groupes *******
    New-ADOrganizationalUnit -Name "Groupes" -Path "ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "Globaux" -Path "ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
    New-ADOrganizationalUnit -Name "Locaux" -Path "ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"


#*******Ajout de chaque utilisateur dans son OU spécifique *******

foreach ($user in $users) {
    
    $name = $user.firstName + " " + $user.lastName
    $fname = $user.firstName
    $lname = $user.lastName
    $login = $user.firstName + "." + $user.lastName
    $Uoffice = $user.office
    $Upassword = $user.password
    $dept = $user.department
  
    If ($user.office -eq "$site1") {
        switch($user.department)
        {
            "$service1" {$office = "OU=$service1,OU=Services,OU=$site1,OU=Sites,DC=$netbios,DC=$domain"}  
            "$service2" {$office = "OU=$service2,OU=Services,OU=$site1,OU=Sites,DC=$netbios,DC=$domain"} 
            "$service3" {$office = "OU=$service3,OU=Services,OU=$site1,OU=Sites,DC=$netbios,DC=$domain"}  

        }
    }
    ElseIf ($user.office -eq "$site2") {
        switch($user.department)
        {
            "$service1" {$office = "OU=$service1,OU=Services,OU=$site2,OU=Sites,DC=$netbios,DC=$domain"} 
            "$service2" {$office = "OU=$service2,OU=Services,OU=$site2,OU=Sites,DC=$netbios,DC=$domain"} 
            "$service3" {$office = "OU=$service3,OU=Services,OU=$site2,OU=Sites,DC=$netbios,DC=$domain"}  


        }
    }
    ElseIf ($user.office -eq "$site3") {
        switch($user.department)
        {
            "$service1" {$office = "OU=$service1,OU=Services,OU=$site3,OU=Sites,DC=$netbios,DC=$domain"} 
            "$service2" {$office = "OU=$service2,OU=Services,OU=$site3,OU=Sites,DC=$netbios,DC=$domain"}  
            "$service3" {$office = "OU=$service3,OU=Services,OU=$site3,OU=Sites,DC=$netbios,DC=$domain"}  

        }
    }
    
     try {
            New-ADUser -Name $name -SamAccountName $login -UserPrincipalName $login -DisplayName $name -GivenName $fname -Surname $lname -AccountPassword (ConvertTo-SecureString $Upassword -AsPlainText -Force) -City $Uoffice -Path $office -Department $dept -Enabled $true
            Write-Output "The user : $name has been added "
          
           
        } catch{
            Write-Output "!- The user $name has not been added"
       }   

}
#*********************Groupes Root************************
New-ADGroup -Name "G-InterSite-$service1" -GroupScope Global -GroupCategory Security -Path "ou=Globaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
New-ADGroup -Name "G-InterSite-$service2" -GroupScope Global -GroupCategory Security -Path "ou=Globaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
New-ADGroup -Name "G-InterSite-$service3" -GroupScope Global -GroupCategory Security -Path "ou=Globaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"

#*********************Groupes sous $site1************************
New-ADGroup -Name "G-$site1-$service1" -GroupScope Global -GroupCategory Security -Path "ou=Globaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
New-ADGroup -Name "G-$site1-$service2" -GroupScope Global -GroupCategory Security -Path "ou=Globaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
New-ADGroup -Name "G-$site1-$service3" -GroupScope Global -GroupCategory Security -Path "ou=Globaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"

#*********************Groupes sous $site2************************
New-ADGroup -Name "G-$site2-$service1" -GroupScope Global -GroupCategory Security -Path "ou=Globaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
New-ADGroup -Name "G-$site2-$service2" -GroupScope Global -GroupCategory Security -Path "ou=Globaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
New-ADGroup -Name "G-$site2-$service3" -GroupScope Global -GroupCategory Security -Path "ou=Globaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"

#*********************Groupes sous $site3************************
New-ADGroup -Name "G-$site3-$service1" -GroupScope Global -GroupCategory Security -Path "ou=Globaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
New-ADGroup -Name "G-$site3-$service2" -GroupScope Global -GroupCategory Security -Path "ou=Globaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
New-ADGroup -Name "G-$site3-$service3" -GroupScope Global -GroupCategory Security -Path "ou=Globaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"


foreach ($user in $users) {

    $name = $user.firstName + " " + $user.lastName
    $fname = $user.firstName
    $lname = $user.lastName
    $login = $user.firstName + "." + $user.lastName
    $Uoffice = $user.office
    $Upassword = $user.password
    $dept = $user.department 

#********Ajout des users de $site1 dans leurs groupes********************


    if ($Uoffice -eq "$site1" -and $dept -eq "$service1"){

        Add-ADGroupMember -Identity "G-$site1-$service1" -Members $login
        Write-Output "$name has been added to the group : G-$service1-$site1"

    }
    elseif ($Uoffice -eq "$site1" -and $dept -eq "$service2"){

        Add-ADGroupMember -Identity "G-$site1-$service2" -Members $login
        Write-Output "$name has been added to the group : G-$service2-$site1"

    }
    elseif ($Uoffice -eq "$site1" -and $dept -eq "$service3"){

        Add-ADGroupMember -Identity "G-$site1-$service3" -Members $login
        Write-Output "$name has been added to the group : G-$service3-$site1"

    }


#********Ajout des utilisateurs de $site2 dans leurs groupes********************

    if ($Uoffice -eq "$site2" -and $dept -eq "$service1"){

        Add-ADGroupMember -Identity "G-$site2-$service1" -Members $login
        Write-Output "$name has been added to the group : G-$service1-$site2"

    }
    elseif ($Uoffice -eq "$site2" -and $dept -eq "$service2"){

        Add-ADGroupMember -Identity "G-$site2-$service2" -Members $login
        Write-Output "$name has been added to the group : G-$service2-$site2"

    }
    elseif ($Uoffice -eq "$site2" -and $dept -eq "$service3"){

        Add-ADGroupMember -Identity "G-$site2-$service3" -Members $login
        Write-Output "$name has been added to the group : G-$service3-$site2"

    }


    #********Ajout des users de $site3 dans leurs groupes********************


    if ($Uoffice -eq "$site3" -and $dept -eq "$service1"){

        Add-ADGroupMember -Identity "G-$site3-$service1" -Members $login
        Write-Output "$name has been added to the group : G-$service1-$site3"

    }
    elseif ($Uoffice -eq "$site3" -and $dept -eq "$service2"){

        Add-ADGroupMember -Identity "G-$site3-$service2" -Members $login
        Write-Output "$name has been added to the group : G-$service2-$site3"

    }
    elseif ($Uoffice -eq "$site3" -and $dept -eq "$service3"){

        Add-ADGroupMember -Identity "G-$site3-$service3" -Members $login
        Write-Output "$name has been added to the group : G-$service3-$site3"

    }


}

Add-ADGroupMember -Identity "G-InterSite-$service1" -Members "G-$site1-$service1","G-$site2-$service1","G-$site3-$service1"
Add-ADGroupMember -Identity "G-InterSite-$service2" -Members "G-$site1-$service2","G-$site2-$service2","G-$site3-$service2"
Add-ADGroupMember -Identity "G-InterSite-$service3" -Members "G-$site1-$service3","G-$site2-$service3","G-$site3-$service3"
pause