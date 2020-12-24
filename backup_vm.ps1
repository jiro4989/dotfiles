$external_storage = "D:\backup\wsl"
$distr = "Ubuntu-20.04"
$today = Get-Date -UFormat "%Y-%m-%d"

wsl --export $distr $external_storage\${distr}_${today}.tar
