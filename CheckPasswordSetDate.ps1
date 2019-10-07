# Change the context variable to match your system
# -------------------------------------------------

$context = "OU=USERS,OU=DEMO,OU=CIMITRA,DC=cimitrademo,DC=com" 

# -------------------------------------------------
$firstNameIn=$args[0]
$lastNameIn=$args[1]

 $theResult=Get-ADUser -properties PasswordLastSet  -Identity "CN=${firstNameIn} ${lastNameIn},$context" | Select-Object PasswordLastSet -ExpandProperty PasswordLastSet
 Write-Output "------------------------------------------------------------------------------"
 Write-Output ""
 Write-Output "Last Password Reset for User: ${firstNameIn} ${LastNameIn} was on ${theResult}"
 Write-Output ""
 Write-Output "------------------------------------------------------------------------------"