function reverse
{ 
 $arr = @(Get-ADUser  -Filter *)
 [array]::reverse($arr)
 $arr
 Write-Output "$arr"
}
reverse