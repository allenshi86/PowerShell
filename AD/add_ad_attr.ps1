Import-Module  ActiveDirectory

$user = $args[0]
$samacount = Get-ADUser -Filter {name -eq $user  -or samaccountname -eq $user} | % {$_.SamAccountName}

$attr = @{'ExtensionAttribute1' = 'GoogleGsuite'}

Function check{

    $checkresult = (Get-ADUser -Identity $samacount -Properties *).ExtensionAttribute1

    if ($checkresult -eq 'GoogleGsuite'){
        Write-Output "$user : GoogleGsuite Enable Sucessfully!"
    }
    else{
        Write-Output Write-Output "$user : GoogleGsuite Enable Failure!"
    }
}

if ($samacount -eq $null)
{
    Write-Output "$user : The username is not exist!"
}
else
{
    $attr_value = (Get-ADUser -Identity $samacount -Properties *).ExtensionAttribute1
    if ($attr_value -eq 'GoogleGsuite'){
        Write-Output "$user : GoogleGsuite enabled in the past!"    
    }
    else{
        Set-ADUser -Identity $samacount -Add $attr
        check
    }

}
