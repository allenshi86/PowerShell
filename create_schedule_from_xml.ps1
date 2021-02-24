$task_path = "C:\count_hyperv-vm.xml"

$taskArgs = @{
   User="shi.admin";
   Password=""
   }
$taskname='Count_vm_to_Zabbix'
$xml=(Get-Content $task_path -Raw)

Register-ScheduledTask -Xml  $xml -TaskName $taskname @taskArgs
