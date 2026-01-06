# Script to streamline building the game from source folder using a powershell terminal

#Example path to Playdate SDK. Download it and replace this path with your own.
$SDK = "C:\game\PlaydateSDK"
$GAME = Split-Path -Leaf (Get-Location)

Write-Host "Building $GAME..." -ForegroundColor Green

# Check if a copy of the game already exists in the root of this folder
if (Test-Path "$GAME.pdx") {
    #If so, delete game copy to make room for new one
    Remove-Item "$GAME.pdx" -Recurse -Force
}

# Compile the code in the source folder into a playable Playdate game file
& "$SDK\bin\pdc.exe" source "$GAME.pdx"

# Run the Playdate simulator as long as the build was successful
if ($LASTEXITCODE -eq 0) {
    Write-Host "Build successful! Launching simulator..." -ForegroundColor Green
    & "$SDK\bin\playdateSimulator.exe" "$GAME.pdx"
} else {
    Write-Host "Build failed!" -ForegroundColor Red
}