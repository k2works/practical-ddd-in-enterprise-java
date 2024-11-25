# スクリプトを含むディレクトリの設定
$scriptDir = "ops/pwsh"

# ディレクトリ内のすべての .ps1 ファイルをループ処理
Get-ChildItem "$scriptDir" -Filter *.ps1 | ForEach-Object {
    $script = $_.FullName
    # ファイルが存在し、読み取り可能かどうかをチェック
    if (Test-Path $script -PathType Leaf) {
        try {
            # ファイルが読み取り専用かどうかをチェック
            if ((Get-Item $script).IsReadOnly -eq $false) {
                Write-Output "Executing $script"
                # スクリプトの実行
                Start-Process "pwsh" -ArgumentList "-File", $script -NoNewWindow -Wait
            } else {
                Write-Output "Cannot read $script"
            }
        }
        catch {
            Write-Output ("Error processing {0}: {1}" -f $script, $_)
        }
    } else {
        Write-Output "Cannot read $script"
    }
}