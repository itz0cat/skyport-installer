#!/bin/bash

# Display ASCII Art Logo
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

# Install necessary dependencies
echo "🔧 Installing dependencies..."
sudo mkdir -p /etc/apt/keyrings

# Add NodeSource GPG key
echo "🔑 Adding NodeSource GPG key..."
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

# Add NodeSource repository
echo "📦 Adding Node.js repository..."
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

# Update package list
echo "🔄 Updating package list..."
sudo apt update

# Install Node.js and Git
echo "⬇️ Installing Node.js and Git..."
sudo apt install -y nodejs git

# Clone the repository
echo "📥 Cloning Skyport Panel repository..."
git clone https://github.com/achul123/panel5 || { echo "❌ Failed to clone repository"; exit 1; }

# Navigate to project directory
cd panel5 || { echo "❌ Failed to enter panel5 directory"; exit 1; }

# Install project dependencies
echo "📦 Installing project dependencies..."
npm install

# Run database seed script
echo "🌱 Seeding database..."
npm run seed || { echo "❌ Failed to seed database"; exit 1; }

# Create a new user
echo "👤 Creating a new user..."
npm run createUser || { echo "❌ Failed to create user"; exit 1; }

# Start Skyport
echo "🚀 Starting Skyport Panel..."
node .

echo ""
echo "✅ Installation Completed - Subscribe To Itz0Cat! 🎉"
echo ""
