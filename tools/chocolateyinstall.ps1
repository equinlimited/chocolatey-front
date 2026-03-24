$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName

$url = "https://dl.frontapp.com/desktop/builds/$($env:ChocolateyPackageVersion)/Front-$($env:ChocolateyPackageVersion)-x64.msi"

Write-Host "NOTE: This is an UNOFFICIAL, community-maintained Chocolatey package for Front."
Write-Host "It is not maintained or endorsed by Front and may lag behind official releases."

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'MSI'
  url           = $url

  softwareName  = 'Front'

  checksum      = '1093E6E06D5CE149C2965822D01CDA9DE236CE45340B9B835CFD9C13900812D9'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:ChocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs