## IMPORTANT!! your data will NOT be altered. this is fake. check your Documents folder.

cls
$Source = "$env:userprofile\Desktop\"
$backup_folder= "$env:userprofile\Documents\fakeransomware"
$count = Get-ChildItem "$env:userprofile\Desktop\" | measure | select -ExpandProperty count

[Reflection.Assembly]::LoadWithPartialName("System.Web") | Out-Null
$random = [System.Web.Security.Membership]::GeneratePassword(36,1)

robocopy /mov $Source $backup_folder /s 

1..$count | % { $strPath = $Source + $_; "$random" | Out-File $strPath | Out-Null; $strNewPath = $strPath + ".crypt0r" ; Rename-Item -Path $strPath -NewName $strNewPath; }
cls

write-host "your data is safe. check $backup_folder" -f Yellow

$intro = 
'
               uuuuuuu
             uu$$$$$$$$$$$uu
          uu$$$$$$$$$$$$$$$$$uu
         u$$$$$$$$$$$$$$$$$$$$$u
        u$$$$$$$$$$$$$$$$$$$$$$$u
       u$$$$$$$$$$$$$$$$$$$$$$$$$u
       u$$$$$$$$$$$$$$$$$$$$$$$$$u
       u$$$$$$"   "$$$"   "$$$$$$u
       "$$$$"      u$u       $$$$"
        $$$u       u$u       u$$$
        $$$u      u$$$u      u$$$
         "$$$$uu$$$   $$$uu$$$$"
          "$$$$$$$"   "$$$$$$$"
            u$$$$$$$u$$$$$$$u
             u$"$"$"$"$"$"$u
  uuu        $$u$ $ $ $ $u$$       uuu
 u$$$$        $$$$$u$u$u$$$       u$$$$
  $$$$$uu      "$$$$$$$$$"     uu$$$$$$
u$$$$$$$$$$$uu    """""    uuuu$$$$$$$$$$
$$$$"""$$$$$$$$$$uuu   uu$$$$$$$$$"""$$$"
 """      ""$$$$$$$$$$$uu ""$"""
           uuuu ""$$$$$$$$$$uuu
  u$$$uuu$$$$$$$$$uu ""$$$$$$$$$$$uuu$$$
  $$$$$$$$$$""""           ""$$$$$$$$$$$"
   "$$$$$"                      ""$$$$""
     $$$"                         $$$$"
                                                                                                                                                    
 '
    1..99 | % {
        cls; ""; write-host $intro -ForegroundColor White;write "               RANSOMWARE";write "            MuHaHaHaHaHAHAHA!!!";""; Start-Sleep 1;
}

