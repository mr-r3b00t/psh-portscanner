#check internet access
#change the front port range e.g. 1..1024
443 | % {echo ((new-object Net.Sockets.TcpClient).Connect("allports.exposed",$_)) "Port $_ is open" ; } 2>$null

#check if we are using a proxy
$proxies = ""

$ProxyEnable = (Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings').ProxyEnable
if($ProxyEnable -ne 1){write-host "Proxy Disabled"}else{
$proxies = (Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings').proxyServer

if($proxies.Length -ge 1){write-host "Proxy server detected: " $proxies}else{write-host "No Proxy Detected"}

}

#if we are in a locked down environment try this
#setup  listeners on ur attacker machine then port scan from the target back to your attacker (change all hosts to your IP)
# common ports to try = 53, 443, 80
53 | % {echo ((new-object Net.Sockets.TcpClient).Connect("allports.exposed",$_)) "Port $_ is open" ; } 2>$null
