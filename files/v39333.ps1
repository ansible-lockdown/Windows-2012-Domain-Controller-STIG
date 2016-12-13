import-module activedirectory
import-module grouppolicy

$listDistinguishedNames = (Get-ADOrganizationalUnit -Filter 'Name -like "*"').DistinguishedName
$array = $listDistinguishedNames -split "`r`n"
$arrayLength = $array.length
#$listDistinguishedNames = (Get-ADOrganizationalUnit -Filter 'Name -like "*" -and Name -notlike "Domain Controllers"').DistinguishedName
$ldnSize = $listDistinguishedNames | Measure
$ldnSize = $ldnSize.Count
if ($listDistinguishedNames -eq $null) {
  echo "The list of OU's is null!"
}
#echo "listDistinguishedNames :: $listDistinguishedNames"
#echo "arrayLength :: $arrayLength"
Else {
#  Get-ACL "AD:\\$listDistinguishedName" | foreach ($_.DistinguishedName in $listDistinguishedNames) #| Select -ExpandProperty Access
  for ($i = 0; $i -lt $arrayLength; $i++) {
    echo "arrayValue :: $array[1]"
    Get-ACL "AD:\\($array[$i])" #| Select -ExpandProperty Access
 }
}
