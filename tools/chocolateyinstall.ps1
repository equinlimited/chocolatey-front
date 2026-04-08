$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName

$url = "https://dl.frontapp.com/desktop/builds/3.71.1/Front-machine-3.71.1-x64.msi"

Write-Host "NOTE: This is an UNOFFICIAL, community-maintained Chocolatey package for Front."
Write-Host "It is not maintained or endorsed by Front and may lag behind official releases."

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'MSI'
  url           = $url

  softwareName  = 'Front'

  checksum      = '1EF4B2C21C713C4B4342A214624E3EECD136CDDDA95BFCC30376C388674351DA'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).3.71.1.MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs