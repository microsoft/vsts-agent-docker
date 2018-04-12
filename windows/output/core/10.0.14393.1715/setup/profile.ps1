$webproxy = New-Object System.Net.WebProxy; 
$webproxy.Address = "$env:HTTP_PROXY"; 
$webproxy.BypassProxyOnLocal = $true;
$webproxy.BypassList = "$env:NO_PROXY".Split(",");
[System.Net.WebRequest]::DefaultWebProxy = $webproxy;

# I don't know why but sometimes the powershell can't create a secure channel.
# thanks to the help from here: https://stackoverflow.com/questions/41618766/powershell-invoke-webrequest-fails-with-ssl-tls-secure-channel
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 -bor [Net.SecurityProtocolType]::Tls11 -bor [Net.SecurityProtocolType]::Tls;