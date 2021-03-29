#!/bin/bash

queries_dir="./queries/"
settings_file="./settings"
target_file="./config"

settings=$(cat "$settings_file")
named_queries="\n[named queries]\n"

# TODO: output warning message to not edit config directly

for dir in "$queries_dir"*/; do
  for file in "$dir"*; do
    filename=${file##*/}
    name=${filename%.*}
    sql=$(cat "$file")
    named_queries="$named_queries\n$name='''\n$sql\n'''\n"
  done
done

echo "$settings" > "$target_file"
echo -e "\n$named_queries" >> "$target_file"
