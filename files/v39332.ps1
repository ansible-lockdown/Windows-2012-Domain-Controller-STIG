$distinguishedName = (Get-ADOrganizationalUnit -Filter 'Name -like "Domain Controllers"').DistinguishedName
Get-ACL "AD:\\$distinguishedName" | Select -ExpandProperty Access
