# Prompt the user for the source directory containing the .bin and .cue files
$sourceDirectory = Read-Host "Please enter the path to the directory containing your .bin and .cue files"

# Prompt the user for the output directory where the .iso files will be saved
$outputDirectory = Read-Host "Please enter the path where you want to save the .iso files"

# Ensure the output directory exists, create if it doesn't
if (-not (Test-Path -Path $outputDirectory)) {
    New-Item -Path $outputDirectory -ItemType Directory
    Write-Host "Created output directory at $outputDirectory"
}

# Retrieve all .cue files in the source directory
$cueFiles = Get-ChildItem -Path $sourceDirectory -Filter *.cue

# Check if any .cue files were found
if ($cueFiles.Count -eq 0) {
    Write-Host "No .cue files found in the specified directory."
    return
}

# Loop through each .cue file found
foreach ($index in 0..($cueFiles.Count - 1)) {
    $cueFile = $cueFiles[$index]

    # Assume .bin file has the same name as .cue file
    $binFile = $cueFile.FullName -replace '.cue$', '.bin'

    # Construct the output file path with .iso extension
    $outputFile = Join-Path -Path $outputDirectory -ChildPath ($cueFile.BaseName + ".iso")

    # Display progress
    $progress = @{
        Id              = 1
        Activity        = "Converting .bin and .cue files to .iso"
        Status          = "Processing $($cueFile.Name)"
        PercentComplete = ($index / $cueFiles.Count) * 100
    }
    Write-Progress @progress

    # Execute bchunk to convert the .bin/.cue pair to .iso
    & bchunk.exe -v $binFile $cueFile.FullName $outputFile

    Write-Host "Converted: $binFile to $outputFile"
}

Write-Progress -Id 1 -Activity "Conversion Completed" -Status "All files processed" -Completed
Write-Host "All conversions completed."
