#!/bin/bash

for files in data/*.dat; do
    [ -e "$files" ] || continue
    echo "data"> "$files"
    done