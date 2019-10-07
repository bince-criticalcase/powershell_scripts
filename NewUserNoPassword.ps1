# Change the context variable to match your system
# -------------------------------------------------

$context = "OU=USERS,OU=DEMO,OU=CIMITRA,DC=cimitrademo,DC=com" 

# -------------------------------------------------
# Get the first command-line variable
$firstNameIn=$args[0]
# Make sure the first character is uppercased
$firstNameIn = (Get-Culture).TextInfo.ToTitleCase($firstNameIn)
# Get the second command-line variable
$lastNameIn=$args[1]
# Make sure the first character is uppercased
$lastNameIn = (Get-Culture).TextInfo.ToTitleCase($lastNameIn)
# Make the samAccountName variable from a combination of the user's first and last name
$samAccountName = ($firstNameIn+$lastNameIn).ToLower()
# Default password
$password = 'Changeme_123'

New-ADUser -Name "$firstNameIn $lastNameIn" -GivenName "$firstNameIn" -Surname "$lastNameIn" -SamAccountName "$samAccountName" -AccountPassword (ConvertTo-SecureString "$password" -AsPlainText -force) -passThru -path $context
$theResult = $?

# If good result, display success message
if ($theResult)
{
Write-Output ""
Write-Output ""
Write-Output "New User ${firstNameIn} ${lastNameIn} created in Active Directory"
}

Enable-ADAccount -Identity "CN=$firstNameIn $lastNameIn,$context" -Confirm:$False

Set-ADUser -Identity  "CN=$firstNameIn $lastNameIn,$context" -ChangePasswordAtLogon $true