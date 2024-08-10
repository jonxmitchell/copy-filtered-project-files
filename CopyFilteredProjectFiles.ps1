# Define the root directory and the excluded folders and files
$rootDirectory = "C:\Users\jonxm\OneDrive\Desktop\ark-asa-shop-config-generator"
$excludedFolders = @("out", ".webpack", "node_modules", "target", "icons", "build")
$excludedFiles = @("package-lock.json", "Cargo.lock", "ark_data.json", "run_tree.bat", "tree.ps1", "app.log", "app_log.txt")

# Define the destination directory
$destinationDirectory = "C:\Users\jonxm\OneDrive\Desktop\Copied project files"

# Create the destination directory if it doesn't exist
if (-not (Test-Path -Path $destinationDirectory)) {
    New-Item -ItemType Directory -Path $destinationDirectory
} else {
    # Clear the destination directory
    Get-ChildItem -Path $destinationDirectory -Recurse | Remove-Item -Force -Recurse
}

# Function to determine if a folder is excluded
function IsExcludedFolder {
    param (
        [string]$folderPath
    )
    foreach ($excludedFolder in $excludedFolders) {
        if ($folderPath -like "*\$excludedFolder\*") {
            return $true
        }
    }
    return $false
}

# Function to determine if a file is excluded
function IsExcludedFile {
    param (
        [string]$fileName
    )
    foreach ($excludedFile in $excludedFiles) {
        if ($fileName -eq $excludedFile) {
            return $true
        }
    }
    return $false
}

# Get all files, excluding files in the excluded folders and excluded files
$files = Get-ChildItem -Path $rootDirectory -Recurse -File | Where-Object {
    $fullPath = $_.FullName
    $fileName = $_.Name
    $isExcluded = $false

    # Check if the file is in an excluded folder
    foreach ($excludedFolder in $excludedFolders) {
        if ($fullPath -like "*\$excludedFolder\*") {
            $isExcluded = $true
            break
        }
    }

    # Check if the file is an excluded file
    if (-not $isExcluded) {
        if (IsExcludedFile $fileName) {
            $isExcluded = $true
        }
    }

    -not $isExcluded
}

# Copy the files to the destination directory
foreach ($file in $files) {
    # Determine the destination path (just the file name)
    $destinationPath = Join-Path -Path $destinationDirectory -ChildPath $file.Name

    # Copy the file
    Copy-Item -Path $file.FullName -Destination $destinationPath -Force
}

Write-Host "Files copied to $destinationDirectory"
