$acl = Get-Acl 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\'
$ruleTrustedInstaller = New-Object System.Security.AccessControl.RegistryAccessRule ("NT SERVICE\TrustedInstaller","FullControl","Allow")
$ruleSYSTEM = New-Object System.Security.AccessControl.RegistryAccessRule ("NT AUTHORITY\SYSTEM","FullControl","Allow")
$ruleAdministrators = New-Object System.Security.AccessControl.RegistryAccessRule ("BUILTIN\Administrators","FullControl","Allow")
$ruleUsers = New-Object System.Security.AccessControl.RegistryAccessRule ("BUILTIN\Users","ReadKey","Allow")
$ruleALLAPPLICATIONPACKAGES = New-Object System.Security.AccessControl.RegistryAccessRule ("ALL APPLICATION PACKAGES","ReadKey","Allow")
$acl.SetAccessRule($ruleTrustedInstaller)
$acl.SetAccessRule($ruleSYSTEM)
$acl.SetAccessRule($ruleAdministrators)
$acl.SetAccessRule($ruleUsers)
$acl.SetAccessRule($ruleALLAPPLICATIONPACKAGES)
$acl | Set-Acl -PATH 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurePipeServers\Winreg\'

