#!/bin/bash


for f in *; do
    if [[ -d $f ]]; then
        echo $f
    fi
done