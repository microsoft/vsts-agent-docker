function Core () {
    function dirs (
        [string] $baseDir
    ) {
        Write-Output "$baseDir"
        foreach ($folder in (Get-ChildItem -path ".\derived\minimal" | where-object {$_.Psiscontainer}).Name) {
            Write-Output "$baseDir\minimal\$folder"
        }
    }

   Set-Location ".\core"

    foreach ($versionsLine in Get-Content .\versions | Where-Object { $_ -notmatch '^\s*#' }) {
        $versionsFields = $versionsLine.Split()
        Write-Output "core\$($versionsFields[0])"
        foreach ($releasesLine in Get-Content .\versioned\releases | Where-Object { $_ -notmatch '^\s*#' }) {
            $releasesFields = $releasesLine.Split()
            dirs "core\$($versionsFields[0])\agent\$($releasesFields[0])"
        }    
    }

    Set-Location ..
}

Core
