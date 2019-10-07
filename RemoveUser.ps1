# Change the context variable to match your system
# -------------------------------------------------

$context = "OU=USERS,OU=DEMO,OU=CIMITRA,DC=cimitrademo,DC=com" 

# -------------------------------------------------
# Get the first command-line variable
$firstNameIn=$args[0]
# Get the second command-line variable
$lastNameIn=$args[1]


# Use Remove-ADUser to remove the user
Remove-ADUser  -Identity "CN=$firstNameIn $lastNameIn,$context" -Confirm:$False
$theResult = $?

# If good result, display success message
if ($theResult)
{
Write-Output ""
Write-Output "------------------------------------------------------------------"
Write-Output ""
Write-Output "The User: ${firstNameIn} ${lastNameIn} was removed from Active Directory"
Write-Output ""
Write-Output "------------------------------------------------------------------"
}

