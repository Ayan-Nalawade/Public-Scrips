#!/bin/bash

# Path to the token file
TOKEN_FILE="token.txt"

# Get the absolute path of the script
SCRIPT_PATH=$(realpath "$0")

# Check if the token file exists
if [ ! -f "$TOKEN_FILE" ]; then
  # If the file doesn't exist, prompt for a token and save it
  if [ "$#" -ne 1 ]; then
    echo "Usage: $0 [IP address] for the first time or when changing the token"
    exit 1
  fi
  read -p "Enter your API token: " TOKEN
  echo "$TOKEN" > "$TOKEN_FILE"
#  echo "Token saved successfully."
  IP_ADDRESS=$1
else
  # If the file exists, read the token from it
  TOKEN=$(cat "$TOKEN_FILE")
  IP_ADDRESS=$1
fi

# Perform the API call and print the result
curl -s "https://ipinfo.io/$IP_ADDRESS?token=$TOKEN"

# Add an alias to ~/.bashrc for future usage if it doesn't already exist
if ! grep -q "alias IPT=" ~/.bashrc; then
#  echo "Adding alias to ~/.bashrc..."
#  echo "alias IPT='bash $SCRIPT_PATH'" >> ~/.bashrc
#  echo "Alias added successfully."
  # Reload ~/.bashrc to apply changes immediately
#  echo "Reloading ~/.bashrc..."
  source ~/.bashrc
#  echo "Alias IPT is now available!"
else
#  echo "Alias already exists in ~/.bashrc."
fi
