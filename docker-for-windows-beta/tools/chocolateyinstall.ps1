$version = "1.12.3.8711"
$ErrorActionPreference = 'Stop';

$packageName= 'docker-for-windows-beta'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = "https://download.docker.com/win/beta/$version/InstallDocker.msi"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'docker*'

  checksum      = 'df46ea50103f79a26a20857c9ffdddf43a22c8a4d86a21a329a94db804e77424'
  checksumType  = 'sha256'
 
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
