function Get-Compose-Services {
  $ServiceName = Read-Host -Prompt "Please, name your service: "

  Write-Host "Creating $ServiceName service"
}

Write-Host "Welcome to composable!"
Write-Host "Please, detail the services and images you want to compose for build"

Get-Compose-Services