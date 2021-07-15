
$now = (date).Date

$createtime= Get-ADUser  -SearchBase "ou=employees,ou=im,dc=im,dc=com"  -Filter {objectclass -eq 'user'} -Property whencreated 
$leavetime= Get-ADUser  -SearchBase  "ou=former employee,ou=im,dc=im,dc=com"   -Filter {objectclass -eq 'user'} -Property whenChanged

$newnum=$closednum=0

foreach($i in $createtime.whencreated.date){
   if ($i -eq $now){
     $newnum +=1
   }  
}


foreach($i in $leavetime.whenchanged.date){
   if ($i -eq $now){
     $closednum +=1
   }  
}


C:\zabbix\bin\zabbix_sender.exe -z 172.16.7.20 -p 10051 -s WJ-OFFICE-DC02-VM-HV02  -k new_users -o $newnum
C:\zabbix\bin\zabbix_sender.exe -z 172.16.7.20 -p 10051 -s WJ-OFFICE-DC02-VM-HV02  -k closed_users -o $closednum

