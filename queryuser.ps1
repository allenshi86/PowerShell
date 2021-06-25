

$lists=Get-Content d:\7.txt


Function Queryuser(){
   Foreach ($user in $lists){
       $userinfo=Get-ADUser  -SearchBase 'ou=staff,dc=im,dc=com' -Filter {DisPlayName -eq $user} -Properties displayname,samaccountname,enabled
       $usersam=$userinfo.SamAccountName
       $userdisplayname=$userinfo.DisplayName
       $userstatus=$userinfo.Enabled

       if($userstatus -eq $true){
          Write-Output "$userdisplayname,$usersam,$userstatus"
        #  disableuser($usersam)
       }
   }

}


Function disableuser($sam){
    Set-ADUser -Identity "$sam" -Enabled $false

}


Queryuser
