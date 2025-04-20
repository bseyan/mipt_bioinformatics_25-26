#!/bin/bash
exec < fin
> fout

while read -r name && read -r ticket; do
  if [[ $ticket == *"777"* ]]; then
    echo "$name" >> fout
    echo "$ticket" >> fout
  fi
done
