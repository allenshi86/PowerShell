#每天统计昨日邮件流数量，推送到zabbix.
Add-PSSnapin microsoft.exchange*


$Server="M6-OFFICE-MBX1.132.com","M6-OFFICE-MBX2.132.com","BJ-M6-MBX03.132.com","M6-OFFICE-MBX4.132.com","M6-OFFICE-MBX5.132.com"


$today=get-date
$ago=$today.AddDays(-1)
$from=$ago.ToString("MM/dd/yyyy")
$timeF="$from 00:00:00"
$timeE="$from 23:59:59"

$SCount=$RCount=$DSNCount=0

foreach($i in $Server)
{
  $temp=Get-MessageTrackingLog -Server "$i" -Start "$timeF" -End "$timeE" -ResultSize unlimited 
 
  foreach($j in $temp){
        if($j.EventId -eq "RECEIVE" -and ($j.Source -eq "STOREDRIVER" -or $j.Source -eq "SMTP")){
    
           $SCount++
        }
        if($j.EventId -eq "DELIVER"){
    
           $RCount++
        }
        if($j.EventId -eq "DSN"){
    
           $DSNCount++
        }
   }
   
   C:\zabbix\bin\zabbix_sender.exe -z zabbix-server  -s $i -k sendcount -o $SCount
   C:\zabbix\bin\zabbix_sender.exe -z zabbix-server  -s $i -k receivecount -o $RCount
   C:\zabbix\bin\zabbix_sender.exe -z zabbix-server  -s $i -k dsncount -o $DSNCount
    
 }
 
    
