function info($msg) {
    echo "[$(Get-Date -UFormat "%Y/%m/%d %H:%M%:%S")] [INFO] $msg"
}

info "Start backup_vm.ps1"

$external_storage = "D:\backup\wsl"
$distr = "Ubuntu-20.04"
$today = Get-Date -UFormat "%Y-%m-%d"
$out_basename = "${distr}_${today}"
$out_dir = "$external_storage\$out_basename"
$out_file = "$out_dir\${out_basename}.tar"

# バックアップを保存
info "Saving backups of WSL2 Virtual machine ..."
mkdir $out_dir
wsl --export $distr $out_file
info "Successfully saving backups: path = $out_file"

# バックアップファイルを圧縮。
# PowerShell標準で使える Compress-Archive は2GB以上のファイル圧縮が不可能なので .NET の機能を使う
info "Compress ..."
$zip_file = "${out_dir}.zip"
Add-Type -AssemblyName System.IO.Compression.FileSystem
[IO.Compression.ZipFile]::CreateFromDirectory($out_dir, $zip_file, [IO.Compression.CompressionLevel]::Optimal, $true, [Text.Encoding]::Default)
info "Successfully compressing: path = $zip_file"

info "Print files"
echo ""
echo "| FileSize  | FilePath |"
echo "| --------- | -------- |"
Get-ChildItem $external_storage | % {
    $size = ($_.Length / 1GB).ToString("00.000")
    $file = $_.FullName
    echo "| $size GB | $file"
}
echo ""

# 一時ファイルを削除。
# 再帰的に削除して全滅したら怖いので1つずつ削除する
info "Clear tmp files"
rm $out_file
rm $out_dir
info "Successfully clearing"

info "Completed backup_vm.ps1"