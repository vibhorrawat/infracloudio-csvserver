#!/bin/bash

first=$1
last=$2

while((first<=last)); do
    echo "$((first++)), $RANDOM"
done > inputFile
