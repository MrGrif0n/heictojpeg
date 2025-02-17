#!/bin/bash
# Installer for heictopng
# This script:
#   1. Sets up the virtual environment (myenv) and installs required packages.
#   2. Adds an alias for the heictopng command to your shell configuration file(s).

# Determine the directory where this script is located.
INSTALL_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Installation directory: ${INSTALL_DIR}"

# -------------------------------
# Step 1: Setup Virtual Environment
# -------------------------------
if [ ! -d "$INSTALL_DIR/myenv" ]; then
    echo "Virtual environment 'myenv' not found. Creating it..."
    python -m venv "$INSTALL_DIR/myenv"
    if [ $? -ne 0 ]; then
        echo "Failed to create virtual environment. Please ensure Python3 and the venv module are installed."
        exit 1
    fi
else
    echo "Virtual environment 'myenv' already exists."
fi

# Activate the virtual environment and install dependencies.
source "$INSTALL_DIR/myenv/bin/activate"
echo "Upgrading pip and installing required Python packages..."
pip install --upgrade pip
# Using pillow-heif and Pillow; adjust if you need pyheif instead.
pip install pillow pillow-heif
if [ $? -ne 0 ]; then
    echo "Failed to install Python dependencies."
    deactivate
    exit 1
fi
deactivate
echo "Virtual environment is set up and required packages are installed."

# -------------------------------
# Step 2: Add Alias to Shell Config
# -------------------------------
ALIAS_LINE="alias heictopng='${INSTALL_DIR}/heictopng'"
echo "Preparing to add alias: ${ALIAS_LINE}"

# List of configuration files to update.
CONFIG_FILES=()
if [ -f "$HOME/.bashrc" ]; then
    CONFIG_FILES+=("$HOME/.bashrc")
fi
if [ -f "$HOME/.zshrc" ]; then
    CONFIG_FILES+=("$HOME/.zshrc")
fi

if [ ${#CONFIG_FILES[@]} -eq 0 ]; then
    echo "No .bashrc or .zshrc found. Please add the following alias to your shell config manually:"
    echo "$ALIAS_LINE"
else
    for config in "${CONFIG_FILES[@]}"; do
        echo "Updating ${config}..."
        # Check if an alias for heictopng already exists
        if grep -q "alias heictopng=" "$config"; then
            echo "Alias already exists in ${config}. Skipping."
        else
            echo "$ALIAS_LINE" >> "$config"
            echo "Added alias to ${config}."
        fi
    done
fi

echo "Installation complete!"
echo "Please restart your terminal or run 'source ~/.bashrc' (or 'source ~/.zshrc') to start using the 'heictopng' command."
