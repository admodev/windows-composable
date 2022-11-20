function Create-Compose-File {
  Write-Host "Creating compose file..."

  New-Item .\docker-compose.yml

  Write-Host "Done."
}

# Check if compose file exists
function Not-Exist { -not (Test-Path $args) }
Set-Alias !exist Not-Exist -Option "Constant, AllScope"
Set-Alias exist Test-Path -Option "Constant, AllScope"

function Get-Compose-Services {
  $ServiceName = Read-Host -Prompt "Please, name your service: "

  Write-Host "Creating $ServiceName service"
}

Write-Host "Welcome to composable!"
Write-Host "Please, detail the services and images you want to compose for build when prompted."

if (not-exist ".\docker-compose.y*ml") {
  Create-Compose-File
} else {
  Write-Host "Compose file already exists, skipping..."
}

Get-Compose-Services