<#
.SYNOPSIS
  Packaging of Joomla module files
.DESCRIPTION
  This script packs all needed files of Joomla module together in a ZIP archive, so that it can be installed in Joomla.
.PARAMETER
  None
.INPUTS
  All files needed for this joomla extension
.OUTPUTS
  Joomla extension archive stored in .release
.NOTES
  Version:        1.0
  Author:         Heinl Christian
  Creation Date:  03.12.2020
  Purpose/Change: Initial script development
#>

# ----------------------------------------------------------[Declarations]----------------------------------------------------------

# Name of directory containing the current files. This is the name of the extension
$sExtensionName = (Get-ChildItem).directory.name[0]

# Relative path name of update XML file which is also stored together with zip archive
$sUpdateXMLfilePath = ".release\" + $sExtensionName + "_update.xml"

# Relative path name of changelog XML file which is also stored together with zip archive
$sChangelogXMLfilePath = ".release\changelog.xml"

# URL where module installation archive is loacated
$sDownloadURLPath = "https://raw.githubusercontent.com/heinchrs/mod_kandanda_birthdays/main/.release/"

# -----------------------------------------------------------[Execution]------------------------------------------------------------

# Read content of Joomla extension XML file
$info = [XML] (Get-Content -Path "$sExtensionName.xml")
# Get version information from XML file
$sVersionInfo = $info.DocumentElement.SelectNodes("//version").InnerText

# Construct archive path
$sDestination = ".release\" + $sExtensionName + "-v" + $sVersionInfo + ".zip"
# Exclusion rules. Can use wild cards (*)
$exclude = @(".release",".vscode",".git","*.ps1","*.md")
# Get files to compress using exclusion filer
$files = Get-ChildItem -Path "./" -Exclude $exclude -Name

# Compress
Start-Process -FilePath "C:\Program Files\7-Zip\7z.exe" -ArgumentList "a -tzip $sDestination $files -aoa" -WorkingDirectory $PSScriptRoot
# a     = archive
# tzip  = normal .zip compression style
# -aoa  = Force


# Update version info in update XML file
#################################################
## Create new XML object
#$xml = New-Object XML
## Load content of update XML
#$xml.Load($sUpdateXMLfilePath)
#
## Get element containing the version information
#$elementVersion =  $xml.SelectSingleNode("//version")
## Update the version info with version from module manifest file
#$elementVersion.InnerText = $sVersionInfo
#
## Get element containing the download URL information
#$elementURL =  $xml.SelectSingleNode("//downloadurl")
## Update the download location info according to version from module manifest file
#$elementURL.InnerText = $sDownloadURLPath + $sExtensionName + "-v" + $sVersionInfo + ".zip?raw=true"
#
## Save XML update file
#$xml.Save($sUpdateXMLfilePath)
#Write-Output "Do not forget to update the corresponding XML files"
Write-Host -fore DarkGreen "Do not forget to update the corresponding XML files"
Write-Output $sUpdateXMLfilePath;
Write-Output $sChangelogXMLfilePath;