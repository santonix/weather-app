#!/bin/bash

# Get the local IP address
ip_address=$(hostname -I | awk '{print $1}')
echo "Local IP address: $ip_address"

# Set the port number
ip_port=3000

# Attempt to access the web server
response=$(curl -s http://$ip_address:$ip_port/login)

# Check if the title tag exists in the response
if [[ $? -ne 0 ]] || ! echo "$response" | grep -q '<title>Weather app login</title>'; then
  echo "The website is not coming up, please check"
  exit 1
fi
