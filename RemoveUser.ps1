$firstNameIn=$args[0]
$lastNameIn=$args[1]


# Use Remove-ADUser to remove the user
Remove-ADUser  -Identity "CN=$firstNameIn $lastNameIn,OU=USERS,OU=DEMO,OU=CIMITRA,DC=cimitrademo,DC=com" -Confirm:$False


Write-Output ""
Write-Output "------------------------------------------------------------------"
Write-Output ""
Write-Output "The User: ${firstNameIn} ${lastNameIn} was removed from Active Directory"
Write-Output ""
Write-Output "------------------------------------------------------------------"


