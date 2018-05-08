mkdir ([System.IO.Path]::GetDirectoryName($PROFILE)) -Force | Out-Null
Get-Content .\profile.ps1 -Raw > $PROFILE