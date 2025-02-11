#!/bin/bash

# Check if mitmproxy is installed
if ! command -v mitmproxy &> /dev/null; then
    echo "mitmproxy is not installed. Install it with brew then rerun this script."
    exit 1
fi

# the tail command will skip the first line because it's an informational message
interfaces="$(networksetup -listallnetworkservices | tail -n +2)"

# Function to clean up proxy settings
cleanup() {
    echo -e "\nCleaning up proxy settings..."
    for interface in $interfaces; do
        echo "Disabling proxy on $interface"
        networksetup -setwebproxystate "$interface" off
        networksetup -setsecurewebproxystate "$interface" off
    done
    exit 0
}

# Set up trap for Ctrl+C
trap cleanup SIGINT

IFS=$'\n' # split on newlines in the for loops

for interface in $interfaces; do
  echo "Setting proxy on $interface"
  networksetup -setwebproxy "$interface" localhost 8080
  networksetup -setwebproxystate "$interface" on
  networksetup -setsecurewebproxy "$interface" localhost 8080
  networksetup -setsecurewebproxystate "$interface" on
done

mitmproxy

# Run cleanup even after normal exit
cleanup