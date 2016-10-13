$acl = Get-Acl 'HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\'
$ruleUsers = New-Object System.Security.AccessControl.RegistryAccessRule ("BUILTIN\Users","ReadKey","Allow")
$ruleAdministrators = New-Object System.Security.AccessControl.RegistryAccessRule ("BUILTIN\Administrators","FullControl","Allow")
$ruleSYSTEM = New-Object System.Security.AccessControl.RegistryAccessRule ("NT AUTHORITY\SYSTEM","FullControl","Allow")
#may have to adjust for (subkeys only)
$ruleCREATOROWNER = New-Object System.Security.AccessControl.RegistryAccessRule ("CREATOR OWNER","FullControl","Allow")
$ruleALLAPPLICATIONPACKAGES = New-Object System.Security.AccessControl.RegistryAccessRule ("ALL APPLICATION PACKAGES","ReadKey","Allow")
$acl.SetAccessRule($ruleUsers)
$acl.SetAccessRule($ruleAdministrators)
$acl.SetAccessRule($ruleSYSTEM)
$acl.SetAccessRule($ruleCREATOROWNER)
$acl.SetAccessRule($ruleALLAPPLICATIONPACKAGES)
$acl | Set-Acl -PATH 'HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\'
#may have to adjust (for 64-bit systems only)
$acl2 = Get-Acl 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Active Setup\Installed Components\'
$ruleUsers = New-Object System.Security.AccessControl.RegistryAccessRule ("BUILTIN\Users","ReadKey","Allow")
$ruleAdministrators = New-Object System.Security.AccessControl.RegistryAccessRule ("BUILTIN\Administrators","FullControl","Allow")
$ruleSYSTEM = New-Object System.Security.AccessControl.RegistryAccessRule ("NT AUTHORITY\SYSTEM","FullControl","Allow")
$ruleCREATOROWNER = New-Object System.Security.AccessControl.RegistryAccessRule ("CREATOR OWNER","FullControl","Allow")
$ruleALLAPPLICATIONPACKAGES = New-Object System.Security.AccessControl.RegistryAccessRule ("ALL APPLICATION PACKAGES","ReadKey","Allow")
$acl2.SetAccessRule($ruleUsers)
$acl2.SetAccessRule($ruleAdministrators)
$acl2.SetAccessRule($ruleSYSTEM)
$acl2.SetAccessRule($ruleCREATOROWNER)
$acl2.SetAccessRule($ruleALLAPPLICATIONPACKAGES)
$acl2 | Set-Acl -PATH 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Active Setup\Installed Components\'

