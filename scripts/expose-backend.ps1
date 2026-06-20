Param()

Write-Output "This script uses npx localtunnel to expose localhost:3001 to the internet."
Write-Output "If you don't have npx/npm installed, install Node.js or run localtunnel another way."

Write-Output "Starting localtunnel..."
$proc = Start-Process -FilePath "npx" -ArgumentList @('localtunnel','--port','3001') -NoNewWindow -PassThru -RedirectStandardOutput "localtunnel-out.txt" -RedirectStandardError "localtunnel-err.txt"

Write-Output "Localtunnel started; waiting for URL to appear in output..."
Start-Sleep -Seconds 4
if (Test-Path "localtunnel-out.txt") {
    Get-Content "localtunnel-out.txt" -Wait
} else {
    Write-Output "Output file not found; check that npx and localtunnel are installed."
}
