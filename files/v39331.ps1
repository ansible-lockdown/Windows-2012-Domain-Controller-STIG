$acl = Get-Acl '\Windows\SYSVOL'
$ruleAuthenticatedUsers = New-Object System.Security.AccessControl.FileSystemAccessRule ("NT AUTHORITY\Authenticated Users","ReadAndExecute","ContainerInherit,ObjectInherit","None","Allow")
$ruleServerOperators = New-Object System.Security.AccessControl.FileSystemAccessRule ("BUILTIN\Server Operators","ReadAndExecute","ContainerInherit,ObjectInherit","None","Allow")
#may need to adjust for subfolders and files only
$ruleCREATOROWNER = New-Object System.Security.AccessControl.FileSystemAccessRule ("CREATOR OWNER","FullControl","ContainerInherit,ObjectInherit","InheritOnly","Allow")
#may need to adjust for subfolder and files only
$ruleAdministrators = New-Object System.Security.AccessControl.FileSystemAccessRule ("BUILTIN\Administrators","FullControl","ContainerInherit,ObjectInherit","InheritOnly","Allow")
$ruleSYSTEM = New-Object System.Security.AccessControl.FileSystemAccessRule ("NT AUTHORITY\SYSTEM","FullControl","ContainerInherit,ObjectInherit","None","Allow")
$acl.SetAccessRule($ruleAuthenticatedUsers)
$acl.SetAccessRule($ruleServerOperators)
$acl.SetAccessRule($ruleCREATOROWNER)
$acl.SetAccessRule($ruleAdministrators)
$acl.SetAccessRule($ruleSYSTEM)
$acl | Set-Acl -PATH '\Windows\SYSVOL'
