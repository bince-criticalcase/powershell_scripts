# Assign first parameter to script to: $theComputer
$theComputer=$args[0]


# Use Remove-ADComputer to remove the computer
Remove-ADComputer  -Identity "CN=$theComputer,OU=COMPUTERS,OU=DEMO,OU=CIMITRA,DC=cimitrademo,DC=com" -Confirm:$False


Write-Output ""
Write-Output "------------------------------------------------------------------"
Write-Output ""
Write-Output "The Computer: $theComputer was removed from Active Directory"
Write-Output ""
Write-Output "------------------------------------------------------------------"




