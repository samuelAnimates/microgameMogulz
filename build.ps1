# Script to streamline building the game from source folder using a powershell terminal
# Note the example paths below are written for a macOS with powershell installed

# Set important variables here to make sure you have them.
$env:PLAYDATE_SDK_PATH = "/Applications/PlaydateSDK"
$SDK = "/Applications/PlaydateSDK"
$GAME = Split-Path -Leaf (Get-Location)

# Output a message in the terminal to note that the build has started
Write-Host "Building $GAME..." -ForegroundColor Green

# Check if a copy of the game already exists in the root of this folder
if (Test-Path "$GAME.pdx") {
    # If so, delete game copy to make room for new one
    Remove-Item "$GAME.pdx" -Recurse -Force
}

# Compile the code in the source folder into a playable Playdate game file
& "$SDK/bin/pdc" source "$GAME.pdx"

# Run the Playdate simulator as long as the build was successful
if ($LASTEXITCODE -eq 0) {
    # Output a message in the terminal announcing the build
    Write-Host "Build successful! Launching simulator..." -ForegroundColor Green
    # Run the new build in the Playdate simulator
    & open -a "$SDK/bin/Playdate Simulator.app" "$GAME.pdx"
}
# If the build wasn't successful, output a message in the terminal
else {
    Write-Host "Build failed!" -ForegroundColor Red
}