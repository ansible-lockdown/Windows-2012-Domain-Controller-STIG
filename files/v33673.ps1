import-module activedirectory
import-module grouppolicy

#get-command -module grouppolicy

$GPOList = Get-Gpo -All
echo "GPOList: $GPOList"
#$GPODomainController = Get-Gpo -Guid 6AC1786C-016F-11D2-945F-00C04fB984F9
#$GPODefaultDomainPolicy = Get-Gpo -Guid 31B2F340-016D-11D2-945F-00C04FB984F9
#$displayName1 = ($GPODomainController).DisplayName
#$displayName2 = ($GPODefaultDomainPolicy).DisplayName
echo "GPODomainController: $displayName1"
echo "GPODefaultDomainPolicy: $displayName2"
$group = Get-ADGroup -Filter *
echo "All : $group"
#$permissions = Get-GPPermissions -Name $displayName1
#echo "Permissions: $permissions"
#$GPODomainControllerPermissions = Get-GPPermissions -All -Guid 6AC1786C-016F-11D2-945F-00C04fB984F9
#echo "GPODomainControllerPermissions: $GPODomainControllerPermissions"
#$GPOList | foreach{set-gppermissions -guid $_.id -targetname $group -targettype Group -PermissionLevel GpoEditDeleteModifySecurity}
