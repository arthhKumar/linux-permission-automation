#!/bin/bash

# 1. Collect Target Folder Information
echo "=================================================="
echo "    Automated Linux Directory Hardening Utility   "
echo "=================================================="
read -p "Enter the absolute path of the directory to secure: " target_dir

# Error Handling: Check if the folder actually exists
if [ ! -d "$target_dir" ]; then
    echo "[!] Error: Target directory does not exist. Exiting."
    exit 1
fi

echo "\n[*] Commencing system hardening in: $target_dir"
echo "--------------------------------------------------"

# 2. The Core Hardening Loop
for file in "$target_dir"/*; do
    # Ensure we are looking at a regular file, not a subfolder
    if [ -f "$file" ]; then
        echo "[+] Processing File: $(basename "$file")"
        
        # High-Impact Security Action: Set permissions to 600
        # 600 means: Owner can Read/Write. Group and Others get absolute ZERO access.
        chmod 600 "$file"
        
        echo "    [Success] Permissions locked securely."
    fi
done

echo "--------------------------------------------------"
echo "[*] Directory Hardening Completed Successfully!"