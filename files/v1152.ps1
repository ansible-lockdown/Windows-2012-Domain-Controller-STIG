$acl = Get-Acl 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurePipeServers\Winreg\'
$ruleAdministrators = New-Object System.Security.AccessControl.RegistryAccessRule ("BUILTIN\Administrators","FullControl","ContainerInherit,ObjectInherit","None","Allow")
#no inheritance/propogation flags set to satisfy (This key only)
$ruleBackupOperators = New-Object System.Security.AccessControl.RegistryAccessRule ("BUILTIN\Backup Operators","ReadKey","Allow")
$ruleLOCALSERVICE = New-Object System.Security.AccessControl.RegistryAccessRule ("NT AUTHORITY\LOCAL SERVICE","ReadKey","ContainerInherit,ObjectInherit","None","Allow")
$acl.SetAccessRule($ruleAdministrators)
$acl.SetAccessRule($ruleBackupOperators)
$acl.SetAccessRule($ruleLOCALSERVICE)
$acl | Set-Acl -PATH 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurePipeServers\Winreg\'

