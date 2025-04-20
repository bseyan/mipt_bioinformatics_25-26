#!/bin/bash


total_chars=0

while IFS= read -r line; do
  if [[ $line =~ [0-9] && ! $line =~ [xXyY] ]]; then
    clean_line="${line//$'\n'/}"
    total_chars=$((total_chars + ${#clean_line}))
  fi
done < fin

echo "$total_chars" > fout
