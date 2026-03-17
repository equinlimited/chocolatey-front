$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName

$url = 'https://dl.frontapp.com/win32/FrontSetupMachine.msi'

Write-Host "NOTE: This is an UNOFFICIAL, community-maintained Chocolatey package for Front."
Write-Host "It is not maintained or endorsed by Front and may lag behind official releases."

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'MSI'
  url           = $url

  softwareName  = 'Front'

  checksum      = '059BCE9FA288078473DB710F1D32DB1AFB4E365613B92273728BDAF5D6C8DC37'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs