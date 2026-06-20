Param()

Write-Output "Starting backend (apps/backend)..."
Start-Process -FilePath "C:\\Users\\HP\\.bun\\bin\\bun.exe" -ArgumentList @('run','dev') -WorkingDirectory "${PSScriptRoot}\\..\\apps\\backend" -NoNewWindow -PassThru

Start-Sleep -Seconds 2
Write-Output "Starting frontend (apps/frontend)..."
Start-Process -FilePath "C:\\Users\\HP\\.bun\\bin\\bun.exe" -ArgumentList @('run','dev') -WorkingDirectory "${PSScriptRoot}\\..\\apps\\frontend" -NoNewWindow -PassThru

Start-Sleep -Seconds 4
Write-Output "Opening http://localhost:3000 in default browser..."
Start-Process "http://localhost:3000"

Write-Output "Done. Use Ctrl+C in the terminal windows where Bun runs to stop servers."
