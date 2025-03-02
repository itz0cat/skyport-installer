#!/bin/bash

# Ensure the script stops on errors
set -e

# Install necessary dependencies
echo "[INFO] Updating package list and installing dependencies..."
sudo apt update && sudo apt install -y figlet curl sudo gpg

# Display the ASCII Art logo
figlet -f slant "Itz0Cat"
echo "Modified by Itz0Cat"
echo "OG script by SoloPlayzDev"
echo ""

# Step 1: Add NodeSource GPG key
echo "[INFO] Adding Node.js GPG key..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

# Step 2: Add NodeSource repository
echo "[INFO] Adding Node.js repository..."
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list > /dev/null

# Step 3: Update package list
echo "[INFO] Updating package list..."
sudo apt update -y

# Step 4: Install Node.js and Git
echo "[INFO] Installing Node.js and Git..."
sudo apt install -y nodejs git

# Step 5: Clone the repository if it doesn’t exist
if [ ! -d "skyportd" ]; then
    echo "[INFO] Cloning the repository..."
    git clone https://github.com/achul123/skyportd
else
    echo "[INFO] Repository already exists. Pulling latest changes..."
    cd skyportd
    git pull
    cd ..
fi

# Final Instructions
echo ""
echo "[SUCCESS] Installation Completed! Next steps:"
echo "-------------------------------------------"
echo "cd skyportd"
echo "npm install"
echo "Enter Your Node Config"
echo "node ."
echo "-------------------------------------------"
