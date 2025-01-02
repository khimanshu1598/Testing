# Load YAML module
Import-Module 'PSYaml'

# Path to the consolidated YAML file
$yamlPath = ".\consolidated-variables.yml"

# Load the YAML file
$yamlContent = Get-Content -Raw -Path $yamlPath
$librarySets = $yamlContent | ConvertFrom-Yaml

# Fetch the consolidated variables
$variables = $librarySets | Select-Object -ExpandProperty library_sets

# Assign variables
$variableName = $variables["CellName"].value
$defaultValue = $variables["DefaultVar"].value

# Display the message
Write-Output "Hi $variableName, This workflow is running for $environment and is having default value as $defaultValue"
