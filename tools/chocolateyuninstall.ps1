$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  softwareName   = 'Front'
  fileType       = 'MSI'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1605, 1614, 1641)
}

[array]$keys = Get-UninstallRegistryKey -SoftwareName $packageArgs.softwareName |
  Where-Object { $_.Publisher -eq 'Front' }

if ($keys.Count -eq 1) {
  $key = $keys[0]

  # For MSI, Uninstall-ChocolateyPackage expects ProductCode first in silentArgs
  $packageArgs.silentArgs = "$($key.PSChildName) $($packageArgs.silentArgs)"
  $packageArgs.file = ''

  Uninstall-ChocolateyPackage @packageArgs
}
elseif ($keys.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
}
else {
  Write-Warning "$($keys.Count) matches found for '$($packageArgs.softwareName)' (Publisher='Front')."
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  $keys | ForEach-Object { Write-Warning "- $($_.DisplayName) [$($_.Publisher)]" }
}
