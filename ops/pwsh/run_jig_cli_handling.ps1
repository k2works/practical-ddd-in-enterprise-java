# JARファイルのパス設定
$jarPath = "./jig-cli.jar"
# 出力ディレクトリ
$jigOutputDirectory = "./docs/jig/handling"
# 検索パターンの設定
$pattern = ".+\.domain\..+"

# 情報を読み取るルートディレクトリ
$projectPath = "./"
# 追加のディレクトリパラメータ
$directoryClasses = "target/classes/com/practicalddd/cargotracker/handling"
$directoryResources = "src/main/resources/main"
$directorySources = "src/main/java/com"

# JARファイルの実行
Start-Process "java" -ArgumentList @(
  "-jar $jarPath",
  "--jig.output.directory=$jigOutputDirectory",
  "--jig.pattern.domain=$pattern",
  "--project.path=$projectPath",
  "--directory.classes=$directoryClasses",
  "--directory.resources=$directoryResources",
  "--directory.sources=$directorySources"
)