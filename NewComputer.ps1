# Get the first command-line variable
$theComputer=$args[0]
# Get the second command-line variable
$theComputerType=$args[1]

# Correlate the number to a word with a switch statement
switch ($theComputerType)
{

    1 {$ComputerType = 'MacOS'}
    2 {$ComputerType = 'Windows'}
    3 {$ComputerType = 'Chromebook'}
    4 {$ComputerType = 'Linux'}
    5 {$ComputerType = 'Other'}
    default{$ComputerType = 'MacOS'}

}

# Add the Computer to Active Directory
New-ADComputer $theComputer -Path "OU=COMPUTERS,OU=DEMO,OU=CIMITRA,DC=cimitrademo,DC=com" 
# Get the exit result from Active Directory
$theResult = $?

# If good result, display success, and update the OS
if ($theResult = 'True')
{
Write-Output ""
Write-Output ""
Write-Output "The Computer: $theComputer was created in Active Directory"
Set-ADComputer -OperatingSystem "${ComputerType}" -Identity "CN=$theComputer,OU=COMPUTERS,OU=DEMO,OU=CIMITRA,DC=cimitrademo,DC=com"
Write-Output "Computer Type = ${ComputerType}"
Write-Output "------------------------------------------------------------------"
Get-ADComputer -Filter 'Name -like $theComputer'
Write-Output "------------------------------------------------------------------"
}




