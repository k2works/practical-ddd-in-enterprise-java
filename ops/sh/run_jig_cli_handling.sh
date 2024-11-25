#!/bin/sh

# JARファイルのパス設定
jarPath="./ops/jig-cli.jar"
# 出力ディレクトリ
jig_output_directory="./docs/jig/handling"
# 検索パターンの設定
pattern=".+\.domain\..+"

# 情報を読み取るルートディレクトリ
project_path=./
# 追加のディレクトリパラメータ
directory_classes="target/classes/com/practicalddd/cargotracker/handling"
directory_resources="src/main/resources/main"
directory_sources="src/main/java/com"

# JARファイルの実行
java -jar $jarPath \
  --jig.output.directory=$jig_output_directory \
  --jig.pattern.domain=$pattern \
  --project.path=$project_path \
  --directory.classes=$directory_classes \
  --directory.resources=$directory_resources \
  --directory.sources=$directory_sources