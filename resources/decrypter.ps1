# Copy original files to original desktop
$source = [Environment]::GetFolderPath("MyDocuments") + "\backup"
$destination = [Environment]::GetFolderPath("Desktop")
$Wallpaper = (Get-ChildItem $source | where name -Like "CachedImage*").FullName

    #Download and import Wallpaper script
    $link = "https://raw.githubusercontent.com/Andreas6920/FakeRansomware/main/resources/set-wallpaper.ps1"
    $path = $($env:ProgramData)+"\Andreas6920\Set-Wallpaper.ps1"
    (New-Object net.webclient).Downloadfile("$link", "$path");
    Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
    Import-Module $path

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
    