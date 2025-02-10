#!/bin/bash

# Display the ASCII Art logo
echo ""
echo " ______   __               __   ____              __       "
echo "/\__  _\ /\ \__          /'__`\/\  _`\           /\ \__    "
echo "\/_/\ \/ \ \ ,_\  ____  /\ \/\ \ \ \/\_\     __  \ \ ,_\   "
echo "   \ \ \  \ \ \/ /\_ ,`\\ \ \ \ \ \ \/_/_  /'__`\ \ \ \/   "
echo "    \_\ \__\ \ \_\/_/  /_\ \ \_\ \ \ \L\ \/\ \L\.\_\ \ \_  "
echo "    /\_____\\ \__\ /\____\\ \____/\ \____/\ \__/.\_\\ \__\ "
echo "    \/_____/ \/__/ \/____/ \/___/  \/___/  \/__/\/_/ \/__/ "
echo ""
echo "🚀 Skyport Installer - Maintained by Itz0Cat"
echo ""

# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
  echo "❌ Error: This script must be run as root (sudo)." >&2
  exit 1
fi

echo ""
echo "🚀 Skyport Daemon Installer - Maintained by Itz0Cat"
echo ""

# Install necessary dependencies
echo "🔧 Installing necessary dependencies..."
sudo mkdir -p /etc/apt/keyrings || { echo "❌ Failed to create keyrings directory"; exit 1; }

# Add NodeSource GPG key
echo "🔑 Adding NodeSource GPG key..."
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg || { echo "❌ Failed to add GPG key"; exit 1; }

# Add NodeSource repository
echo "📦 Adding Node.js repository..."
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list > /dev/null

# Update package list
echo "🔄 Updating package list..."
sudo apt update || { echo "❌ Failed to update package list"; exit 1; }

# Install Node.js and Git
echo "⬇️ Installing Node.js and Git..."
sudo apt install -y nodejs git || { echo "❌ Failed to install Node.js and Git"; exit 1; }

# Clone the repository
echo "📥 Cloning Skyport Daemon repository..."
git clone https://github.com/achul123/skyportd || { echo "❌ Failed to clone repository"; exit 1; }

echo ""
echo "✅ Installation Done! Next Steps: 🚀"
echo "--------------------------------------"
echo "📌 Navigate to the project directory:"
echo "   cd skyportd"
echo ""
echo "📌 Install dependencies:"
echo "   npm install"
echo ""
echo "📌 Enter your Node.js configuration, then start the daemon:"
echo "   node ."
echo "--------------------------------------"
echo "🎉 Skyport Daemon is now installed!"
echo ""

