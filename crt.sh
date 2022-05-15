#!/bin/bash

TARGET="$1"

curl -s https://crt.sh/\?q\=%.$TARGET\&output\=json > /tmp/curl.out
cat /tmp/curl.out | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u > $TARGET-crt.txt
cat $TARGET-crt.txt
