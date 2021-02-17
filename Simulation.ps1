## IMPORTANT!! your data will NOT be encrypted or altered. just moved to a desktop folder called "backup_ransomwaresim"

$Source = "C:\temp\test1\"
$backup_folder= "$env:userprofile\Desktop\backup_ransomwaresim"
$test = dir $Source\* | measure | Select-Object -expand Count
[Reflection.Assembly]::LoadWithPartialName("System.Web") | Out-Null
$random = [System.Web.Security.Membership]::GeneratePassword(36,1)
robocopy /mov $Source $backup_folder/s | Out-Null
GCI $Source | Remove-Item -Force

1..$test | % { $strPath = $Source + $_; "$random" | Out-File $strPath | Out-Null; $strNewPath = $strPath + ".crypt0r" ; Rename-Item -Path $strPath -NewName $strNewPath; }
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