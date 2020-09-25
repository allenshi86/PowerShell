Add-PSSnapin microsoft.exchange*

$dbs = Get-MailboxDatabase | % {$_.Name}
$dbhash = @{}  #定义一个hashtable，存储数据库和其对应的用户数。

Foreach ($db in $dbs)
{ 
   if ($db -like "Staff*")
   {
        $usernum = (Get-Mailbox -Database $db -ResultSize unlimited | % {$_.Name} ).count
        $dbhash["$db"]=$usernum
    }
}

$mini = ($dbhash.Values | Measure-Object -Minimum).Minimum

Foreach ($key in  $dbhash.Keys)
{
   if ($dbhash[$key] -eq  $mini)
    {
       Write-Output $key   #可以使用New-Mailbox 调用$key.
    }
    
}
