function info($msg) {
  Write-Host "[$(Get-Date -UFormat "%Y/%m/%d %H:%M%:%S")] [INFO] $msg"
}

function err($msg) {
  Write-Host "[$(Get-Date -UFormat "%Y/%m/%d %H:%M%:%S")] [ERR ] $msg"
}

info "Creating a new VM from backup VM file."

$wsl_dir = "c:\Users\jiro4989\wsl"
$external_storage = "D:\backup\wsl"

ls "$external_storage"

$vm_file = Read-Host "Enter a VM file"
if ($vm_file -lt 5) {
  err "vm_file was too short."
  exit
}
$base_file = "$external_storage\$vm_file"

wsl -l -v

$distro = Read-Host "Enter a new distribution name"
if ($distro -lt 5) {
  err "distro was too short."
  exit
}

info "wsl --import $distro $wsl_dir\$distro $base_file"

$yes = Read-Host "Create? [y/n]"
if ($yes -eq "y") {
  if (!(Test-Path $wsl_dir)) {
    mkdir $wsl_dir
    info "Created $wsl_dir"
  }
  wsl --import $distro $wsl_dir\$distro $base_file
  wsl -l -v
  info "Successfully creating VM: distribution = $distro"
  exit
}

info "Canceled"