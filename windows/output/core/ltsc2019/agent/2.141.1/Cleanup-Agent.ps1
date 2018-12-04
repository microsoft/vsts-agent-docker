Param(

)

Begin {
    Set-Location "C:\TFS\Agent"

    if ((!$env:TFS_USER) -and (!$env:TFS_TOKEN)) {
        Write-Error "error: missing TFS_USER environment variable"
        exit 1
    }

    if ((!$env:TFS_PASSWORD) -and (!$env:TFS_TOKEN)) {
        Write-Error "error: missing TFS_PASSWORD environment variable"
        exit 1
    }

    if ((!$env:TFS_USER) -and (!$env:TFS_PASSWORD) -and (!$env:TFS_TOKEN)) {
        Write-Error "error: missing TFS_TOKEN environment variable"
        exit 1
    }

    $argagentauth = ""
    if (($env:TFS_USER) -and ($env:TFS_PASSWORD)) {
        $argagentauth = "--auth negotiate --username `"$env:TFS_USER`" --password `"$env:TFS_PASSWORD`""
    }
    else {
        $argagentauth = "--auth PAT --token $env:TFS_TOKEN"
    }
}    

Process {
    if (Test-Path ".\config.cmd") {
        Invoke-Expression "& .\config.cmd remove --unattended $argagentauth"
    }
}

End {
    
}