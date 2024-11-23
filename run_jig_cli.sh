#!/bin/sh

# JARファイルのパス設定
jarPath="./jig-cli.jar"

# 検索パターンの設定
pattern=".+\.domain\..+"

# 情報を読み取るルートディレクトリ
project_path=./
# 追加のディレクトリパラメータ
directory_classes="target/classes"
directory_resources="src/main/resources/main"
directory_sources="src/main/java/com"

# JARファイルの実行
java -jar $jarPath \
  --jig.pattern.domain=$pattern \
  --project.path=$project_path \
  --directory.classes=$directory_classes \
  --directory.resources=$directory_resources \
  --directory.sources=$directory_sources