function Create-Compose-File {
  Write-Host "Creating compose file..."

  New-Item .\docker-compose.yml

  Write-Host "Done."
}

# Check if compose file exists
function Not-Exist { -not (Test-Path $args) }
Set-Alias !exist Not-Exist -Option "Constant, AllScope"
Set-Alias exist Test-Path -Option "Constant, AllScope"

function Choose-Compose-Version {
  $DockerComposeVersion = Read-Host -Prompt "Please, choose a compose version for your file: 3.0, 3.1, 3.2, 3.3..."

  Add-Content -Path ".\docker-compose.y*ml" -Value "version: '$DockerComposeVersion'"
}

function Append-Compose-Service {
  $ServiceContent = $args[0]
  Add-Content -Path ".\docker-compose.y*ml" -Value $ServiceContent
}

function Get-Compose-Services {
  $ServiceName = Read-Host -Prompt "Please, name your service: "

  Write-Host "Creating $ServiceName service"

  Append-Compose-Service @"
services:
  ${ServiceName}:
"@

  Write-Host "Done!"
}

Write-Host "Welcome to composable!"
Write-Host "Please, detail the services and images you want to compose for build when prompted."

if (not-exist ".\docker-compose.y*ml") {
  Create-Compose-File
} else {
  Write-Host "Compose file already exists, skipping..."
}

Choose-Compose-Version

Get-Compose-Services