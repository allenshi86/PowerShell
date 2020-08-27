#2020-08-27
#检测半小时内认证失败次数大于等于15次的账户

$oupath =  "ou=xxx,dc=132,dc=com" 
$nowtime = Get-Date
$starttime = $nowtime.AddMinutes(-30)
$username = 'username'
$password = ConvertTo-SecureString 'password'  -AsPlainText -Force
$cred =  New-Object System.Management.Automation.PSCredential($username,$password)

#将命令执行结果转化为字符形式才能作为邮件body体。
#使用BadLogonCount 和badPwdCount 都可以。

$body = Get-ADUser -SearchBase $oupath -Properties * -Filter {BadLogonCount -ge 15 -and Enabled -eq "True"} | Format-Table DisplayName,samAccountName,AccountLockoutTime,BadLogonCount -AutoSize  | Out-String

Send-MailMessage  -From 'wechat_it@132.com' -To  'user1@132.com','user1@132.com','user3@132.com' -Subject "AD账号监测-认证失败次数【$starttime-$nowtime】 "  -SmtpServer 'mail.132.com' -Body $body -Credential $cred -Encoding 'utf8'
 
 
