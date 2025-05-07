if(-not(Test-Path $PROFILE/..)) {
    New-Item $PROFILE/.. -ItemType Directory -Force
}

Copy-Item $PWD/* $PROFILE/..
Invoke-Command { & "pwsh.exe" }
