echo "Creating a new VM from backup VM file."

$wsl_dir = "c:\Users\jiro4989\wsl"
$external_storage = "D:\backup\wsl"

ls "$external_storage"

$vm_file = Read-Host "Enter a VM file"
if ($vm_file -lt 5) {
  echo "[ERR] vm_file was too short."
  exit
}
$base_file = "$external_storage\$vm_file"

wsl -l -v

$distro = Read-Host "Enter a new distribution name"
if ($distro -lt 5) {
  echo "[ERR] distro was too short."
  exit
}

echo "wsl --import $distro $wsl_dir\$distro $base_file"
