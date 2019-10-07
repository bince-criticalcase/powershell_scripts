# Change the context variable to match your system
# -------------------------------------------------

$context = "OU=COMPUTERS,OU=DEMO,OU=CIMITRA,DC=cimitrademo,DC=com" 

# -------------------------------------------------
Write-Output ""
Write-Output "Following is a list of all of the computers, newest to oldest."
Write-Output "------------------------------------------------------"
function reverse
{ 
 $arr = @(Get-ADComputer -Filter * -SearchBase $context | Select Name) 
 [array]::reverse($arr)
 $arr
}
#Call the reverse function
reverse
Write-Output ""
Write-Output "------------------------------------------------------"