#The script below is left to test that the loop functions properly when the list does indeed have values
#$listDistinguishedNames = (Get-ADOrganizationalUnit -Filter 'Name -like "*"').DistinguishedName
#This list in the lab environment returns null, but should correctly fetch all OU's
$listDistinguishedNames = (Get-ADOrganizationalUnit -Filter 'Name -like "*" -and Name -notlike "Domain Controllers"').DistinguishedName
$array = $listDistinguishedNames -split "`r`n"
$arrayLength = $array.length
if ($listDistinguishedNames -eq $null) {
  echo "The list of applicable OU's is null!"
}
Else {
  for ($i = 0; $i -lt $arrayLength; $i++) {
     echo "arrayValue :: $($array[$i])"
     Get-ACL "AD:\\$($array[$i])" | Select -ExpandProperty Access
  }
}
