
$FilePath = "C:\inetpub\logs\LogFiles\W3SVC1","C:\inetpub\logs\LogFiles\W3SVC1","C:\inetpub\logs\LogFiles\IMAPLOG","C:\inetpub\logs\LogFiles\POPLOG"
$DaysAgo=2
$Today=Get-Date

foreach ($i in $FilePath)
{ 
    if(test-path $i){
        Get-ChildItem -Path  $i "*.log" | Where-Object {$_.LastWriteTime -lt $Today.AddDays(-$DaysAgo)} |Remove-Item
    }
}
