$firstNameIn=$args[0]
$lastNameIn=$args[1]
$newPasswordIn=$args[2]

Set-ADAccountPassword -Identity "CN=${firstNameIn} ${lastNameIn},OU=USERS,OU=DEMO,OU=CIMITRA,DC=cimitrademo,DC=com" -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "$newPasswordIn" -Force)

 $theResult=Get-ADUser -properties PasswordLastSet  -Identity "CN=${firstNameIn} ${lastNameIn},OU=USERS,OU=DEMO,OU=CIMITRA,DC=cimitrademo,DC=com" | Select-Object PasswordLastSet -ExpandProperty PasswordLastSet
 Write-Output "------------------------------------------------------------------------------"
 Write-Output ""
 Write-Output "Password Reset for User: ${firstNameIn} ${lastNameIn} on ${theResult}"
 Write-Output ""
 Write-Output "------------------------------------------------------------------------------"
