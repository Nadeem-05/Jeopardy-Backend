#!/bin/bash
# to run this script open a terminal in the same folder and run the below two lines
# chmod +x requirements.sh
# ./requirements.sh
# Step 1: Install nvm (Node Version Manager)
echo "Installing nvm (Node Version Manager)..."
if command -v curl &> /dev/null; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
elif command -v wget &> /dev/null; then
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
else
  echo "Neither curl nor wget is installed. Please install one of them to proceed."
  exit 1
fi

# Step 2: Load nvm (You can add these lines to your shell configuration file to load nvm automatically)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Step 3: Verify nvm installation
if ! command -v nvm &> /dev/null; then
  echo "nvm installation failed. Please check the installation steps."
  exit 1
fi

# Step 4: Install the latest LTS version of Node.js
echo "Installing the latest LTS version of Node.js..."
nvm install --lts

# Step 5: Set the installed LTS version as default
echo "Setting the installed LTS version as the default..."
nvm alias default 'lts/*'

# Step 6: Verify Node.js and npm installation
echo "Verifying Node.js and npm installation..."
node -v
npm -v

# Step 7: Install http-server npm package
echo "Installing http-server npm package..."
npm install -g http-server

# Step 8: Verify http-server installation
echo "Verifying http-server installation..."
if command -v http-server &> /dev/null; then
  echo "http-server has been installed successfully."
else
  echo "http-server installation failed."
fi

echo "Node.js, npm, and http-server have been installed successfully."
