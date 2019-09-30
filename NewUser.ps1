$firstNameIn=$args[0]
$firstNameIn = (Get-Culture).TextInfo.ToTitleCase($firstNameIn)
$lastNameIn=$args[1]
$lastNameIn = (Get-Culture).TextInfo.ToTitleCase($lastNameIn)
$passwordIn=$args[2]
$samAccountName = $firstNameIn[0]+'.'+$lastNameIn


# Read in parameters and assign them to variables
$firstNameIn=$args[0]
$lastNameIn=$args[1]
$passwordIn=$args[2]
$samAccountName = $firstNameIn[0]+'.'+$lastNameIn

# Create the new user
New-ADUser -Name "$firstNameIn $lastNameIn" -GivenName "$firstNameIn" -Surname "$lastNameIn" -SamAccountName "$samAccountName" -AccountPassword (ConvertTo-SecureString "$passwordIn" -AsPlainText -force) -passThru -path "OU=USERS,OU=DEMO,OU=CIMITRA,DC=cimitrademo,DC=com"

# Catch the exit code from running the command
$theResult = $?

if ($theResult = 'True')
{
Write-Output ""
Write-Output ""
Write-Output "New User ${firstNameIn} ${lastNameIn} created in Active Directory"
}

# Enable the account
Enable-ADAccount -Identity "CN=$firstNameIn $lastNameIn,OU=USERS,OU=DEMO,OU=CIMITRA,DC=cimitrademo,DC=com" -Confirm:$False

# Force an immediate password reset
Set-ADUser -Identity  "CN=$firstNameIn $lastNameIn,OU=USERS,OU=DEMO,OU=CIMITRA,DC=cimitrademo,DC=com" -ChangePasswordAtLogon $true

