#!/bin/bash

# the tail command will skip the first line because it's an informational message
interfaces="$(networksetup -listallnetworkservices | tail -n +2)"

IFS=$'\n' # split on newlines in the for loops

for interface in $interfaces; do
  echo "Setting proxy on $interface"
  networksetup -setwebproxy "$interface" localhost 8080
  networksetup -setwebproxystate "$interface" on
  networksetup -setsecurewebproxy "$interface" localhost 8080
  networksetup -setsecurewebproxystate "$interface" on
done

mitmproxy

for interface in $interfaces; do
  echo "Disabling proxy on $interface"
  networksetup -setwebproxystate "$interface" off
  networksetup -setsecurewebproxystate "$interface" off
done