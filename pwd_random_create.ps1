
$lowletter = @('a','b','c','d','e')
$bigletter = @('A','B','C','D','E','F')
$number = @('1','2','3','4','5','6','7')
$symbol = @('@','!','#','%','(',')')

$pwd = @()
$pwd = $lowletter| Get-Random
$pwd += $bigletter | Get-Random
$pwd += $number | Get-Random
$pwd += $symbol | Get-Random

$dict = @{low=$lowletter;big=$bigletter;no=$number;sym=$symbol}

for($i=1;$i -le 4;$i++){
   $k = $dict.Keys |Get-Random
   $pwd += $dict[$k]|Get-Random
}


Write-Output $pwd
