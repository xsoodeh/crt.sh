#!/bin/bash

domain=$1

if [ $# -lt 1 ]
then
    echo "Usage: ./crt.sh example.com)"
    exit 0
fi
 
curl -s "https://crt.sh/?q=%.${domain}&output=json" | jq -r '.[] | .comman_name, .name_value ' | sed 's/\*\.//g' | sort -u | uniq > ${domain}_subdomains.txt &&
echo "Result ${domain}_subdomain.txt"

