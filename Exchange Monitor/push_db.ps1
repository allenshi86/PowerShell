Add-PSSnapin Microsoft.Exchange*
Add-PSSnapin ActiveDirectory*

#$Hosts=New-Object -TypeName System.Collections.ArrayList

$DBs=Get-MailboxDatabase | % {$_.Name}
$VAR1="{"
$VAR2='"data": ['
$VAR3='"{#DB_NAME}":'
$VAR4="]"
$VAR5="}"
$VAR6="},"


Write-Output $VAR1
Write-Output "   $VAR2"

ForEach($i in $DBs)
{
Write-Output "      $VAR1"
Write-Output "         $VAR3 `"$i`""
    if ($i -eq $DBs[-1])
    {         
        Write-Output "      $VAR5"

    }
    else
      {         
        Write-Output "      $VAR6"

    }

}

Write-Output "   $VAR4"
Write-Output $VAR5


