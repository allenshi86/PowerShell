


Function get-info {
   foreach ($line in Get-Content $args[0]) {
      $a = Get-ADUser -Filter {samaccountname -eq $line}  -Properties DisplayName,CN,samaccountname  | select DisplayName,CN,samaccountname  
      if ($a -eq $null){
         Write-Output "---"
      }
      else{ 
         Write-Output $a

      }
  } 
}

get-info("D:\1.txt") 

#get-info("D:\1.txt") | Out-File D:\result.csv
