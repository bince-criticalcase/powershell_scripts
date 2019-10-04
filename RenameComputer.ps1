# Change the context variable to match your system
# -------------------------------------------------

$context = "OU=COMPUTERS,OU=DEMO,OU=CIMITRA,DC=cimitrademo,DC=com" 

# -------------------------------------------------
$theComputerOldNameIn = $args[0]
$theComputerNewNameIn = $args[1]

Rename-ADObject -Identity "CN=$theComputerOldNameIn,$context" -NewName "$theComputerNewNameIn"  
$theResult = $?

if ($theResult)
{
Write-Output "--------------------------------------------------------"
Write-Output ""
Write-Output "The Computer: $theComputerOldNameIn was renamed to $theComputerNewNameIn"
Write-Output ""
Write-Output "--------------------------------------------------------"

}