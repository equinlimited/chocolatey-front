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

  checksum      = '5F7478EEBEC2F9553B2B14DC9C8166893A7E2A610CFA842E6FE7D0A42B5C1E0E'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs