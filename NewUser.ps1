$firstNameIn=$args[0]
$firstNameIn = (Get-Culture).TextInfo.ToTitleCase($firstNameIn)
$lastNameIn=$args[1]
$lastNameIn = (Get-Culture).TextInfo.ToTitleCase($lastNameIn)
$passwordIn=$args[2]
$samAccountName = $firstNameIn[0]+'.'+$lastNameIn


New-ADUser -Name "$firstNameIn $lastNameIn" -GivenName "$firstNameIn" -Surname "$lastNameIn" -SamAccountName "$samAccountName" -AccountPassword (ConvertTo-SecureString "$passwordIn" -AsPlainText -force) -passThru -path "OU=USERS,OU=DEMO,OU=CIMITRA,DC=cimitrademo,DC=com"
$theResult = $?

if ($theResult = 'True')
{
Write-Output ""
Write-Output ""
Write-Output "New User ${firstNameIn} ${lastNameIn} created in Active Directory"
}

Enable-ADAccount -Identity "CN=$firstNameIn $lastNameIn,OU=USERS,OU=DEMO,OU=CIMITRA,DC=cimitrademo,DC=com" -Confirm:$False

Set-ADUser -Identity  "CN=$firstNameIn $lastNameIn,OU=USERS,OU=DEMO,OU=CIMITRA,DC=cimitrademo,DC=com" -ChangePasswordAtLogon $true