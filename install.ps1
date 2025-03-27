Copy-Item $PWD/* $PROFILE/..
Invoke-Command { & "pwsh.exe" }
