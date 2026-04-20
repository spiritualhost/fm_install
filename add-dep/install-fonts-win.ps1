# Credit due to Jordan Malcolm: https://www.jordanmalcolm.com/deploying-windows-10-fonts-at-scale/
# This file is separated out so the in-line logic doesn't get too messy in fm_install.cmd

# Use the environment variables as provided in config.bat
$fontSource = $env:FONT_PATH

# List out all the applicable font files in the user-provided directory
$FontItem = Get-Item -Path $fontSource
$FontList = Get-ChildItem -Path "$FontItem\*" -Include ('*.fon','*.otf','*.ttc','*.ttf')

foreach ($Font in $FontList) {
        Add-Content -Path $env:LOCAL_LOG -Value "Installing font $($Font.BaseName)..."
        Copy-Item $Font "C:\Windows\Fonts"
        New-ItemProperty -Name $Font.BaseName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $Font.name         
}