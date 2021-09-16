#!/usr/bin/env bash

languages=`echo "cpp c typescript javascript nodejs react command" | tr ' ' '\n'`
core_utils=`echo "xargs find mv sed" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`

read -p "query: " query

if printf "$languages" | grep -qs $selected; then
  processed_query=`echo $query | tr ' ' '+'`
  tmux neww bash -c "curl cht.sh/$selected/$processed_query & while [ : ]; do sleep 1; done"
else
  tmux neww bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
fi

