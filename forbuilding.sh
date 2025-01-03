#!/bin/bash

# Prompt the user for choices
echo "Please choose one or more options (separate by spaces):"
echo "1. Coding"
echo "2. Essentials"
echo "3. Nvidia"
read -p "Enter your choices: " choices

# Install Coding related packages
if [[ "$choices" =~ "Coding" || "$choices" =~ "1" ]]; then
    echo "Installing Coding packages..."
    sudo apt install -y build-essential python3 python3-pip python-is-python3
fi

# Install Essentials related packages
if [[ "$choices" =~ "Essentials" || "$choices" =~ "2" ]]; then
    echo "Installing Essentials packages..."
    sudo apt install -y htop curl wget nano neofetch
fi

# Install Nvidia related packages
if [[ "$choices" =~ "Nvidia" || "$choices" =~ "3" ]]; then
    echo "Installing Nvidia packages..."
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-ubuntu2404.pin
    sudo mv cuda-ubuntu2404.pin /etc/apt/preferences.d/cuda-repository-pin-600
    wget https://developer.download.nvidia.com/compute/cuda/12.6.3/local_installers/cuda-repo-ubuntu2404-12-6-local_12.6.3-560.35.05-1_amd64.deb
    sudo dpkg -i cuda-repo-ubuntu2404-12-6-local_12.6.3-560.35.05-1_amd64.deb
    sudo cp /var/cuda-repo-ubuntu2404-12-6-local/cuda-*-keyring.gpg /usr/share/keyrings/
    sudo apt-get update
    sudo apt-get -y install cuda-toolkit-12-6
fi

echo "Installation complete!"
