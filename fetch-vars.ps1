# Ensure YamlDotNet is installed
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module -Name YamlDotNet -Force -Scope CurrentUser
Import-Module YamlDotNet

# Path to the consolidated YAML file
$yamlPath = ".\consolidated-variables.yml"

# Load the YAML file
$yamlContent = Get-Content -Raw -Path $yamlPath
$librarySets = [YamlDotNet.Serialization.Deserializer]::new().Deserialize([string[]]$yamlContent)

# Fetch the consolidated variables
$variables = $librarySets.library_sets

# Assign variables
$variableName = $variables["CellName"].value
$defaultValue = $variables["DefaultVar"].value

# Display the message
Write-Output "Hi $variableName, This workflow is running for $environment and is having default value as $defaultValue"
