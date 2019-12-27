$target = "192.168.1.16"

$sleep = 1 #number of seconds to sleep between port scans 
$start = 1
$end = 443
$range = $end - $start
 
 
 $portlist = Get-Random -Count $range -InputObject ($start..$end)

 $c = 0
 foreach ($port in $portlist) {
 start-sleep $sleep
 write-host 'testing port:' $port
 $c = $c + 1
((new-object Net.Sockets.TcpClient).Connect($target,$port))

 write-host $c
 }
