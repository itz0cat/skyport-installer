#!/bin/bash

# Automatically re-run as root if not already
if [[ $EUID -ne 0 ]]; then
  echo "🔄 Re-running script as root..."
  exec sudo bash "$0" "$@"
fi

# Install necessary dependencies
echo "🔧 Installing dependencies..."
mkdir -p /etc/apt/keyrings

# Add NodeSource GPG key
echo "🔑 Adding NodeSource GPG key..."
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

# Add NodeSource repository
echo "📦 Adding Node.js repository..."
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

# Update package list
echo "🔄 Updating package list..."
apt update

# Install Node.js and Git
echo "⬇️ Installing Node.js and Git..."
apt install -y nodejs git

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
