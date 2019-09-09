Write-Output ""
Write-Output "Following is a list of all of the computers, newest to oldest."
Write-Output "------------------------------------------------------"
function reverse
{ 
 $arr = @(Get-ADComputer -Filter * -SearchBase "OU=COMPUTERS,OU=DEMO,OU=CIMITRA,DC=cimitrademo,DC=com" | Select Name) 
 [array]::reverse($arr)
 $arr
}
reverse
Write-Output ""
Write-Output "------------------------------------------------------"