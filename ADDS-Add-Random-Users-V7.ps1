######################################################
#        CREATE AND POPULATE YOUR ADDS               #
#          **A script by brlndtech **                #
#      github : https://github.com/brlndtech         #
#            Please RTFM README.md                   #
#                        V6                          #
######################################################

######################################################

# Site géographique de base : Paris,Lyon,Marseille 
# A changer ctrl h dans le csv user-random.csv

# Site géographiqu de base : Paris,Lyon,Marseille 
# A changer ctrl h dans le csv user-random.csv



Import-Module ActiveDirectory
Import-Module 'Microsoft.PowerShell.Security'

$users = Import-Csv -Delimiter ";" -Path "users-random.csv"


$netbios=Read-Host "Entrez le NetBIOS de votre domaine (ex : entreprise) "
$domain=Read-Host "Entrez votre .tld (ex : .com) "


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


#*******Ajout de chaque utilisateur dans son OU spécifique*******

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
            "$service1" {$office = "OU=$service1,OU=Services,OU=$site1,OU=Sites,DC=$netbios,DC=$domain"} # à modifier, pour adpater à sa sauce 
            "$service2" {$office = "OU=$service2,OU=Services,OU=$site1,OU=Sites,DC=$netbios,DC=$domain"} # à modifier, pour adpater à sa sauce
            "$service3" {$office = "OU=$service3,OU=Services,OU=$site1,OU=Sites,DC=$netbios,DC=$domain"} # à modifier, pour adpater à sa sauce 

        }
    }
    ElseIf ($user.office -eq "$site2") {
        switch($user.department)
        {
            "$service1" {$office = "OU=$service1,OU=Services,OU=$site2,OU=Sites,DC=$netbios,DC=$domain"} # à modifier, pour adpater à sa sauce
            "$service2" {$office = "OU=$service2,OU=Services,OU=$site2,OU=Sites,DC=$netbios,DC=$domain"} # à modifier, pour adpater à sa sauce
            "$service3" {$office = "OU=$service3,OU=Services,OU=$site2,OU=Sites,DC=$netbios,DC=$domain"} # à modifier, pour adpater à sa sauce 


        }
    }
    ElseIf ($user.office -eq "$site3") {
        switch($user.department)
        {
            "$service1" {$office = "OU=$service1,OU=Services,OU=$site3,OU=Sites,DC=$netbios,DC=$domain"} # à modifier, pour adpater à sa sauce
            "$service2" {$office = "OU=$service2,OU=Services,OU=$site3,OU=Sites,DC=$netbios,DC=$domain"} # à modifier, pour adpater à sa sauce 
            "$service3" {$office = "OU=$service3,OU=Services,OU=$site3,OU=Sites,DC=$netbios,DC=$domain"} # à modifier, pour adpater à sa sauce 

        }
    }
    
     try {
            New-ADUser -Name $name -SamAccountName $login -UserPrincipalName $login -DisplayName $name -GivenName $fname -Surname $lname -AccountPassword (ConvertTo-SecureString $Upassword -AsPlainText -Force) -City $Uoffice -Path $office -Department $dept -Enabled $true
            echo "Utilisateur ajouté : $name"
          
           
        } catch{
            echo "-Utilisateur non ajouté : $name"
       }   

}
#*********************Groupes Root************************
New-ADGroup -Name "G-InterSite-$service1" -GroupScope Global -GroupCategory Security -Path "ou=Globaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
New-ADGroup -Name "G-InterSite-$service2" -GroupScope Global -GroupCategory Security -Path "ou=Globaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
New-ADGroup -Name "G-InterSite-$service3" -GroupScope Global -GroupCategory Security -Path "ou=Globaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"

#*********************Groupes sous $site2************************
New-ADGroup -Name "G-$service1-$site2" -GroupScope Global -GroupCategory Security -Path "ou=Globaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
New-ADGroup -Name "G-$service2-$site2" -GroupScope Global -GroupCategory Security -Path "ou=Globaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
New-ADGroup -Name "G-$service3-$site2" -GroupScope Global -GroupCategory Security -Path "ou=Globaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"

#*********************Groupes sous $site1************************
New-ADGroup -Name "G-$service1-$site1" -GroupScope Global -GroupCategory Security -Path "ou=Globaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
New-ADGroup -Name "G-$service2-$site1" -GroupScope Global -GroupCategory Security -Path "ou=Globaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
New-ADGroup -Name "G-$service3-$site1" -GroupScope Global -GroupCategory Security -Path "ou=Globaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"


#*********************Groupes sous $site3************************
New-ADGroup -Name "G-$service1-$site3" -GroupScope Global -GroupCategory Security -Path "ou=Globaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
New-ADGroup -Name "G-$service2-$site3" -GroupScope Global -GroupCategory Security -Path "ou=Globaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"
New-ADGroup -Name "G-$service3-$site3" -GroupScope Global -GroupCategory Security -Path "ou=Globaux,ou=Groupes,ou=Sites,dc=$netbios,dc=$domain"


foreach ($user in $users){

    $name = $user.firstName + " " + $user.lastName
    $fname = $user.firstName
    $lname = $user.lastName
    $login = $user.firstName + "." + $user.lastName
    $Uoffice = $user.office
    $Upassword = $user.password
    $dept = $user.department 

#********Ajout des users de $site1 dans leurs groupes********************


    if ($Uoffice -eq "$site1" -and $dept -eq "$service1"){

        Add-ADGroupMember -Identity "G-$service1-$site1" -Members $login
        echo "$name a été ajouté au groupe G-$service1-$site1"

    }
    elseif ($Uoffice -eq "$site1" -and $dept -eq "$service2"){

        Add-ADGroupMember -Identity "G-$service2-$site1" -Members $login
        echo "$name a été ajouté au groupe G-$service2-$site1"

    }
    elseif ($Uoffice -eq "$site1" -and $dept -eq "$service3"){

        Add-ADGroupMember -Identity "G-$service3-$site1" -Members $login
        echo "$name a été ajouté au groupe G-$service3-$site1"

    }


#********Ajout des utilisateurs de $site2 dans leurs groupes********************

    if ($Uoffice -eq "$site2" -and $dept -eq "$service1"){

        Add-ADGroupMember -Identity "G-$service1-$site2" -Members $login
        echo "$name a été ajouté au groupe G-$service1-$site2"

    }
    elseif ($Uoffice -eq "$site2" -and $dept -eq "$service2"){

        Add-ADGroupMember -Identity "G-$service2-$site2" -Members $login
        echo "$name a été ajouté au groupe G-$service2-$site2"

    }
    elseif ($Uoffice -eq "$site2" -and $dept -eq "$service3"){

        Add-ADGroupMember -Identity "G-$service3-$site2" -Members $login
        echo "$name a été ajouté au groupe G-$service3-$site2"

    }


    #********Ajout des users de $site3 dans leurs groupes********************


    if ($Uoffice -eq "$site3" -and $dept -eq "$service1"){

        Add-ADGroupMember -Identity "G-$service1-$site3" -Members $login
        echo "$name a été ajouté au groupe G-$service1-$site3"

    }
    elseif ($Uoffice -eq "$site3" -and $dept -eq "$service2"){

        Add-ADGroupMember -Identity "G-$service2-$site3" -Members $login
        echo "$name a été ajouté au groupe G-$service2-$site3"

    }
    elseif ($Uoffice -eq "$site3" -and $dept -eq "$service3"){

        Add-ADGroupMember -Identity "G-$service3-$site3" -Members $login
        echo "$name a été ajouté au groupe G-$service3-$site3"

    }


} #Accolade fermante de notre boucle – Fin de la boucle

Add-ADGroupMember -Identity "G-InterSite-$service1" -Members "G-$service1-$site1","G-$service1-$site2","G-$service1-$site3"
Add-ADGroupMember -Identity "G-InterSite-$service2" -Members "G-$service2-$site1","G-$service2-$site2","G-$service2-$site3"
Add-ADGroupMember -Identity "G-InterSite-$service3" -Members "G-$service3-$site1","G-$service3-$site2","G-$service3-$site3"