 #!/bin/bash
sudo apt install figlet
set -e  # Stop the script on any errors

figlet -f slant "Skyport"

echo "Modfied by Itz0Cat"
echo "OG script by SoloPlayzDev"

# Step 1: Install necessary dependencies
echo "[INFO] Installing necessary dependencies..."
sudo apt update -y

# Ensure curl, sudo, and gpg are installed
sudo apt install -y curl sudo gpg

# Step 2: Set up Node.js repository
echo "[INFO] Setting up Node.js repository..."
sudo mkdir -p /etc/apt/keyrings
if [ ! -f "/etc/apt/keyrings/nodesource.gpg" ]; then
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
fi
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list > /dev/null

# Step 3: Install Node.js and Git
echo "[INFO] Installing Node.js and Git..."
sudo apt update -y
sudo apt install -y nodejs git

# Step 4: Clone the repository if it doesn’t exist
if [ ! -d "panel5" ]; then
    echo "[INFO] Cloning the repository..."
    git clone https://github.com/achul123/panel5
else
    echo "[INFO] Repository already exists. Pulling latest changes..."
    cd panel5
    git pull
    cd ..
fi

# Step 5: Navigate to project directory
cd panel5

# Step 6: Install project dependencies
echo "[INFO] Installing project dependencies..."
npm install

# Step 7: Run database seed script
echo "[INFO] Running database seed..."
npm run seed

# Step 8: Create a new user
echo "[INFO] Creating a new user..."
npm run createUser

# Step 9: Start Skyport
echo "[INFO] Starting Skyport..."
node .

echo "[SUCCESS] Installation Completed!"
