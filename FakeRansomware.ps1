## IMPORTANT!! your data will NOT be altered. this is fake. check your Documents folder.

#Prepare system

    #Create folders
    $folder_base =  "$($env:ProgramData)\andreas6920\"
        mkdir $folder_base -ea ignore | Out-Null
    $wallpaper = "$folder_base\Wallpaper.jpg"
    $note = "$folder_base\READ_ME.txt"
    $movedfiles = "$folder_base\fake_files.txt"
    
    Invoke-WebRequest "https://github.com/Andreas6920/FakeRansomware/raw/main/resources/Background.jpg" -o $wallpaper
    Invoke-WebRequest "https://github.com/Andreas6920/FakeRansomware/raw/main/resources/note.txt" -o $note


#File encryption
    $targetdir = [Environment]::GetFolderPath("Desktop")
    $backupdir = [Environment]::GetFolderPath("MyDocuments") + "\backup"
    $files = (get-childitem -File $targetdir -Depth 100).FullName | where { ! $_.PSIsContainer }
    $fileextension = "cRypt0r"


#Copy folder structure
Robocopy $targetdir $backupdir /E /XF *.* | out-null

#Backup wallpaper
$currentwallpaper = (Get-ChildItem $env:AppData\Microsoft\Windows\Themes\CachedFiles| where name -Like "CachedImage*")
Copy-item -Path $currentwallpaper.FullName -Destination $backupdir\$currentwallpaper

foreach ($file in $files)
{
#Ignore files bigger than 1GB, to speed things up
if(Get-ChildItem $file  | Where-Object {$_.Length -lt 1gb}){

#Copying file from targetdir to backupdir
$newdir = $file.Replace($targetdir,$backupdir)
Copy-Item $file $newdir
Remove-item $file

#Generate fake encrypted file
$encrypted = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($file))
$encryptedcontent = $encrypted
$encrypted = $encrypted.Substring($encrypted.Length - 16).replace("=","")
$encrypted = $encrypted + ".$fileextension"
$path = Join-path -path (Split-Path $file) -ChildPath $encrypted;
$path >> $movedfiles
new-item $path | out-null
Add-Content -Path $path -Value $encryptedcontent

}}

#Wallpaper
    
    #Download and import Wallpaper script
    $link = "https://raw.githubusercontent.com/Andreas6920/FakeRansomware/main/resources/set-wallpaper.ps1"
    $path = $($env:ProgramData)+"\Andreas6920\Set-Wallpaper.ps1"
    (New-Object net.webclient).Downloadfile("$link", "$path");
    Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
    Import-Module $path

    #Set wallpaper
    Set-WallPaper -Image $wallpaper -Style Stretch | Out-Null

    # Leave Ransom Note
    Copy-Item -Path $note -Destination $targetdir | Out-Null

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
    $$$$uu      "$$$$$$$$$"     uu$$$$$$
    $$$$$$$$$$uu    """""    uuuu$$$$$$$$$$
   $$$$"""$$$$$$$$$$uuu   uu$$$$$$$$$"""$$$"
   """      ""$$$$$$$$$$$uu ""$"""
          uuuu ""$$$$$$$$$$uuu
   u$$$uuu$$$$$$$$$uu ""$$$$$$$$$$$uuu$$$
   $$$$$$$$$$""""           ""$$$$$$$$$$$"
   "$$$$$"                      ""$$$$""
    $$$"                         $$$$"
                                                                                                                                                
'
1..99 | % {cls; ""; write-host $intro -ForegroundColor White; Write-Host "               RANSOMWARE";Write-Host "            MuHaHaHaHaHAHAHA!!!";""; Start-Sleep 1;}




