$ErrorActionPreference = 'Stop'

$packageName = 'databricks-odbcdriver'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'Simba Spark 2.6 32-bit.msi'
$fileLocation64 = Join-Path $toolsDir 'Simba Spark 2.6 64-bit.msi'

Install-ChocolateyZipPackage -PackageName $packageName `
  -Url 'https://databricks-bi-artifacts.s3.us-east-2.amazonaws.com/simbaspark-drivers/odbc/2.6.29/SimbaSparkODBC-2.6.29.1049-Windows-32bit.zip' `
  -Checksum '4caeb6b98138757961b85a6bd340ead8fe0edfd1f5c9dc48de98f598f5fb3b95' `
  -ChecksumType 'sha256' `
  -UnzipLocation $toolsDir `
  -Url64 'https://databricks-bi-artifacts.s3.us-east-2.amazonaws.com/simbaspark-drivers/odbc/2.6.29/SimbaSparkODBC-2.6.29.1049-Windows-64bit.zip' `
  -Checksum64 '50269b9f20c61f1bfc6cfec0a7015b2ab7b586f387d55fde3f83867bd9e2f781' `
  -ChecksumType64 'sha256'

$params = @{
  PackageName    = $packageName
  FileType       = 'msi'
  File           = $fileLocation
  File64         = $fileLocation64
  SilentArgs     = "/qn /norestart"
  ValidExitCodes = @(0)
}

Install-ChocolateyPackage @params
