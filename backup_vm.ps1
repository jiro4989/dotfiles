echo "Saving backups of WSL2 Virtual machine ..."

$external_storage = "D:\backup\wsl"
$distr = "Ubuntu-20.04"
$today = Get-Date -UFormat "%Y-%m-%d"
$out_file = $external_storage\${distr}_${today}.tar

wsl --export $distr $out_file

echo "Successfully saving backups: path = $out_file"
