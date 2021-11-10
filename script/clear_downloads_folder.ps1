function info($msg) {
  Write-Host "[$(Get-Date -UFormat "%Y/%m/%d %H:%M%:%S")] [INFO] $msg"
}

# Change directory�Ɏ��s�����珈���𒆒f����
cd $Env:UserProfile\Downloads -ErrorAction stop

info "Current working directory is:"
pwd | Write-Host

# 1�����ȏ�O�̃t�@�C�����擾
$files = Get-ChildItem | ? { $_.Name -ne "FireShot" } | ? { $_.LastWriteTime -lt (Get-Date).AddDays(-30) }

if ($files.Length -lt 1) {
  info "No deletable files"
  info "Exit script"
  exit
}

info "Delete Download files those last modified time more than a month ago."
$files | % { $_ -replace "^", "  - " } | Write-Host

$yes = Read-Host "Delete? [y/n]"
if ($yes -eq "y") {
  $files | Remove-Item -Force
  info "Successfully removing files"
  info "Exit script"
  exit
}

info "Canceled"