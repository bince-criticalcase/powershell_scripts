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
# Get the third command-line variable
$passwordIn=$args[2]
# Make the samAccountName variable from a combination of the user's first and last name
$samAccountName = ($firstNameIn+$lastNameIn).ToLower()


# Create the new user
New-ADUser -Name "$firstNameIn $lastNameIn" -GivenName "$firstNameIn" -Surname "$lastNameIn" -SamAccountName "$samAccountName" -AccountPassword (ConvertTo-SecureString "$passwordIn" -AsPlainText -force) -passThru -path $context

# Catch the exit code from running the command
$theResult = $?

if ($theResult)
{
Write-Output ""
Write-Output ""
Write-Output "New User ${firstNameIn} ${lastNameIn} created in Active Directory"
}

# Enable the account
Enable-ADAccount -Identity "CN=$firstNameIn $lastNameIn,$context" -Confirm:$False

# Force an immediate password reset
Set-ADUser -Identity  "CN=$firstNameIn $lastNameIn,$context" -ChangePasswordAtLogon $true

