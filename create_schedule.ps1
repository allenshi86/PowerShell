#脚本中调用的zabbix.ps1 的作用是Get-Content zabbix配置文内容并out-file到另一个文件。完全可以当作备份。

$action = New-ScheduledTaskAction -Execute "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"  -Argument "-file C:\Users\shi.admin\Desktop\zabbix.ps1" 
#3分钟执行一次，无期限运行。
$trigger = New-ScheduledTaskTrigger -Once -At (get-date) -RepetitionInterval (New-TimeSpan -Minutes 3) -RepetitionDuration ([System.TimeSpan]::MaxValue)
#电源选型设置
$setting = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -DontStopOnIdleEnd
#S4U：不管用户是否登录都要运行
$principal = New-ScheduledTaskPrincipal -UserId shi.admin -LogonType S4U
$name = New-ScheduledTask -Action $action -Trigger  $trigger   -Settings $setting  -Principal $principal

Register-ScheduledTask -TaskName  "testtask" -InputObject $name 
