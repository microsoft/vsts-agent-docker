Param(

)

Begin {
    Set-Location "C:\TFS\Agent"

    if (!$env:TFS_URL) {
        Write-Error "error: missing TFS_URL environment variable"
        exit 1
    }

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

    if (!$env:TFS_AGENT) {
        $env:TFS_AGENT = "Windows_$(hostname)"
    }

    if (!$env:TFS_WORK) {
        $env:TFS_WORK = "_work"
    }

    if (!$env:TFS_POOL) {
        $env:TFS_POOL = "Default"
    }
    
    $argagentauth = ""
    if (($env:TFS_USER) -and ($env:TFS_PASSWORD)) {
        $argagentauth = "--auth negotiate --username `"$env:TFS_USER`" --password `"$env:TFS_PASSWORD`""
    }
    else {
        $argagentauth = "--auth PAT --token $env:TFS_TOKEN"
    }

    function Cleanup () {
        if (Test-Path ".\config.cmd") {
            Invoke-Expression "& .\config.cmd remove --unattended $argagentauth"
        }    
    }    

    $env:VSO_AGENT_IGNORE = "MAIL,OLDPWD,PATH,PWD,VSO_AGENT_IGNORE,TFS_AGENT,TFS_URL,TFS_USER,TFS_PASSWORD,TFS_POOL,TFS_WORK,TFS_AGENT_DISPOSE,DOTNET_CLI_TELEMETRY_OPTOUT"
}    

Process {
    Write-Output "Configure Agent ..."

    $addcommand = "& .\config.cmd --unattended --url `"$env:TFS_URL`" --pool `"$env:TFS_POOL`" --agent `"$env:TFS_AGENT`" --work `"$env:TFS_WORK`" --replace $argagentauth"
    Write-Output $addcommand

    try {
        Invoke-Expression $addcommand
        Invoke-Expression "& .\run.cmd"
    }
    finally {
        Cleanup;
    }
}

End {
    
}