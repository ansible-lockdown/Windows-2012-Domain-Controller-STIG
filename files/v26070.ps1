$acl = Get-Acl 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\'
$ruleTrustedInstaller = New-Object System.Security.AccessControl.RegistryAccessRule ("NT SERVICE\TrustedInstaller","FullControl","ContainerInherit,ObjectInherit","None","Allow")
$ruleSYSTEM = New-Object System.Security.AccessControl.RegistryAccessRule ("NT AUTHORITY\SYSTEM","FullControl","ContainerInherit,ObjectInherit","None","Allow")
$ruleAdministrators = New-Object System.Security.AccessControl.RegistryAccessRule ("BUILTIN\Administrators","FullControl","ContainerInherit,ObjectInherit","None","Allow")
$ruleUsers = New-Object System.Security.AccessControl.RegistryAccessRule ("BUILTIN\Users","ReadKey","ContainerInherit,ObjectInherit","None","Allow")
$ruleALLAPPLICATIONPACKAGES = New-Object System.Security.AccessControl.RegistryAccessRule ("ALL APPLICATION PACKAGES","ReadKey","ContainerInherit,ObjectInherit","None","Allow")
$acl.SetAccessRule($ruleTrustedInstaller)
$acl.SetAccessRule($ruleSYSTEM)
$acl.SetAccessRule($ruleAdministrators)
$acl.SetAccessRule($ruleUsers)
$acl.SetAccessRule($ruleALLAPPLICATIONPACKAGES)
$acl | Set-Acl -PATH 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\'

