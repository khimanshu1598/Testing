# Ensure PowerShell-YAML is installed and imported
if (-not (Get-Module -ListAvailable -Name powershell-yaml)) {
    Install-Module -Name powershell-yaml -Force -Scope CurrentUser
}
Import-Module powershell-yaml

# Path to the consolidated YAML file
$yamlPath = ".\consolidated-variables.yml"

# Load the YAML file
$yamlContent = Get-Content -Raw -Path $yamlPath
$librarySets = ConvertFrom-Yaml $yamlContent

# Fetch the consolidated variables
$variables = $librarySets.library_sets

# Assign variables
$variableName = $variables["CellName"].value
$defaultValue = $variables["DefaultVar"].value

# Display the message
Write-Output "Hi $variableName, This workflow is running for $environment and is having default value as $defaultValue"
