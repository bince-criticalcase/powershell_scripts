# Change the context variable to match your system
# -------------------------------------------------

$context = "OU=USERS,OU=DEMO,OU=CIMITRA,DC=cimitrademo,DC=com" 

# -------------------------------------------------
function reverse
{ 
 $array = @(Get-ADUser  -Filter * -SearchBase $context)
 [array]::reverse($array)
 $array
}
reverse