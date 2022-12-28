# Copy original files to original desktop
$source = [Environment]::GetFolderPath("MyDocuments") + "\backup"
$destination = [Environment]::GetFolderPath("Desktop")
$Wallpaper = (Get-ChildItem $source | where name -Like "CachedImage*").FullName


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


# Restore wallpaper
    Set-WallPaper -Image $wallpaper -Style Stretch | Out-Null
    Remove-Item $Wallpaper -force -ea SilentlyContinue

# Remove fake files
    $files = "$($env:ProgramData)\andreas6920\fake_files.txt"
    foreach($line in [System.IO.File]::ReadLines($files))
    {remove-item $line -Force -ea ignore | Out-Null}

# restore original files
    robocopy /MIR /Z /W:1 /R:3 $source $destination | Out-Null

# Clean-up
    remove-item $source -Recurse -force -ea SilentlyContinue
    remove-item $destination\READ_ME.txt -Force -ea SilentlyContinue
    remove-item "$($env:ProgramData)\andreas6920\" -Recurse -force -ea SilentlyContinue
    