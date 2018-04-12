.\update.ps1

Write-Output "`n------------------------------------------------------`n"

foreach($dir in .\dirs.ps1){
    Write-Output "Build Docker Image for:`n    $dir"
    docker build --compress `
    -t microsoft/vsts-agent:windows-$(($dir -replace '\\','-').ToLower() ) `
    --build-arg HTTP_PROXY="" `
    --build-arg HTTPS_PROXY="" `
    --build-arg NO_PROXY="" `
    ".\Output\$dir"
    Write-Output "`n------------------------------------------------------`n"
}
