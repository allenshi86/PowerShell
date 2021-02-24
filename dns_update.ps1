#Script_Name： Update_DNS_Server.ps1
#2020-07-28

$new_dns_servers = "172.16.7.54","172.16.7.55"
$old_dns_lists = "172.16.7.54","172.16.7.80"
$ip = Get-NetIPConfiguration 
$ifip = $ip.IPv4Address.IPAddress



#服务器多网卡防止全改
if ($ifip.Split(".")[-2] -eq "7")  {

    $ifindex = $ip.InterfaceIndex
    $current_dns_servers = $ip.DNSServer.ServerAddresses

    foreach ($i in $current_dns_servers) {    
        if ($i -in $old_dns_lists)  {
            Set-DnsClientServerAddress -InterfaceIndex  $ifindex  -ServerAddresses  ($new_dns_servers)
        }  
        
    }
}
