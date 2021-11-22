function info($msg) {
  Write-Host "[$(Get-Date -UFormat "%Y/%m/%d %H:%M%:%S")] [INFO] $msg"
}

function err($msg) {
  Write-Host "[$(Get-Date -UFormat "%Y/%m/%d %H:%M%:%S")] [ERR ] $msg"
}

info "Creating a new VM from backup VM file."

$wsl_dir = "c:\Users\jiro4989\wsl"
$external_storage = "D:\backup\wsl"
$tmp_dir = "c:\Users\jiro4989\tmp"

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

info "Create instance as '${distro}' from '${base_file}' to '$wsl_dir\$distro'"

$yes = Read-Host "Create? [y/n]"
if ($yes -eq "y") {
  if (!(Test-Path $wsl_dir)) {
    mkdir $wsl_dir
    info "Created $wsl_dir"
  }

  # 拡張子が .zip の場合は対象ファイルを解凍する
  $ext = (Get-ChildItem $base_file).Extension
  if ($ext -eq ".zip") {
    # .zipの展開先を作成
    if (!(Test-Path $tmp_dir)) {
      mkdir $tmp_dir
      info "Created $tmp_dir"
    }

    # 圧縮ファイルを解凍
    Expand-Archive -Path $base_file -DestinationPath $tmp_dir

    # 解凍されるとディレクトリができるため、ディレクトリの中のフルパスを取得
    $basename = (Get-ChildItem $base_file).Basename
    $base_file = (Get-ChildItem "$tmp_dir\$basename\${basename}.tar").FullName
  }

  wsl --import $distro $wsl_dir\$distro $base_file
  wsl -l -v
  info "Successfully creating VM: distribution = $distro"

  if ($ext -eq ".zip") {
    # 展開した一時ファイルを削除して後始末。一撃でディレクトリごと消すのは怖いので1ファイルずつ消す
    rm $base_file
    info "Successfully deleting temporary file: file = $base_file"

    rmdir "$tmp_dir\$basename"
    info "Successfully deleting temporary directory: directory = $tmp_dir\$basename"
  }

  exit
}

info "Canceled"