$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName

$url = "https://dl.frontapp.com/desktop/builds/3.73.0/Front-machine-3.73.0-x64.msi"

Write-Host "NOTE: This is an UNOFFICIAL, community-maintained Chocolatey package for Front."
Write-Host "It is not maintained or endorsed by Front and may lag behind official releases."

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'MSI'
  url           = $url

  softwareName  = 'Front'

  checksum      = '4390C6DC667C2C37C5565255A03819172DAA29D6A775A6296E3B4FCA5D75543B'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).3.73.0.MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs