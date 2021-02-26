Add-PSSnapin microsoft.exchange*

$usermailbox = Read-Host "请输入目标邮箱:"
$keywords = Read-Host "请输入主题或内容关键字:"


Search-Mailbox -Identity $usermailbox -SearchQuery "Subject:$keywords OR $keywords"  -DeleteContent -force

