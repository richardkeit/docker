#!/bin/bash

declare -a array=()
x=0

for f in test/*/*; do
    if [[ -f $f ]]; then
        
		echo "My Array is this: ${array[@]}"
        array=("${array[@]}" "$f")
        
        x=+1


    fi
done