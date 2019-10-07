# Change the context variable to match your system
# -------------------------------------------------

$context = "OU=COMPUTERS,OU=DEMO,OU=CIMITRA,DC=cimitrademo,DC=com" 

# -------------------------------------------------
$theComputer=$args[0]


# Use Remove-ADComputer to remove the computer
Remove-ADComputer  -Identity "CN=$theComputer,$context" -Confirm:$False
# Catch the exit code from running the command
$theResult = $?

if($theResult)
{
Write-Output ""
Write-Output "------------------------------------------------------------------"
Write-Output ""
Write-Output "The Computer: $theComputer was removed from Active Directory"
Write-Output ""
Write-Output "------------------------------------------------------------------"
}




