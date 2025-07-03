
#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "--- Running Dev Container Setup Script ---"

# Define the directory where your modules live
MODULES_BASE_PATH="ObsidianWall_SIaC/modules" # Adjust this if your modules are in a different top-level folder

# --- Option 1: Prompt user for modules to checkout ---
echo ""
echo "Welcome to the ObsidianWall Terraform project!"
echo "This project uses Git Sparse Checkout to minimize the local footprint."
echo "Please enter the names of the module(s) you want to work on (space-separated)."
echo "Example: module-a module-b common-networking"
echo "Leave empty to perform a full checkout (not recommended for large repos)."
read -rp "Modules to checkout (e.g., 'network/vpc storage/s3'): " modules_input

# --- Perform Git Sparse Checkout ---
echo "Configuring Git Sparse Checkout..."
git sparse-checkout init --cone

if [ -n "$modules_input" ]; then # Check if input is not empty
    # Convert space-separated input to newline-separated for git sparse-checkout set
    # This allows paths with spaces if you ever have them, though generally avoided in module names
    IFS=' ' read -r -a module_paths_array <<< "$modules_input"

    # Prepend the MODULES_BASE_PATH to each module path
    SPARSE_PATHS=()
    for mod in "${module_paths_array[@]}"; do
        SPARSE_PATHS+="${MODULES_BASE_PATH}/${mod}"
    done

    # Add common project files that are always needed (e.g., devcontainer, docs)
    COMMON_PATHS=(".devcontainer/" "docs/" "README.md" ".github/") # Add other essential top-level files/folders

    # Combine and set the sparse checkout paths
    echo "Checking out selected paths: ${SPARSE_PATHS[*]} ${COMMON_PATHS[*]}"
    git sparse-checkout set "${SPARSE_PATHS[@]}" "${COMMON_PATHS[@]}"

    echo "Successfully checked out specified modules and common files."
else
    echo "No modules specified. Performing a full checkout (this might take a while)."
    git sparse-checkout disable # Disable sparse checkout to get everything
    git checkout # Re-checkout all files
    echo "Full checkout complete."
fi

# --- Initial Terraform Setup (only for selected modules) ---
echo ""
echo "Initializing Terraform for selected modules..."
if [ -n "$modules_input" ]; then
    for mod_path in "${SPARSE_PATHS[@]}"; do
        if [ -d "$mod_path" ]; then # Check if the directory actually exists after sparse checkout
            echo "Running 'terraform init' in $mod_path..."
            (cd "$mod_path" && terraform init -upgrade -backend=false) || { echo "Terraform init failed for $mod_path. Continuing..."; }
            # -backend=false is often good for development if you're not immediately applying
            # If you need to work with a backend, remove -backend=false and ensure backend config is present
        else
            echo "Warning: Module path '$mod_path' not found after sparse checkout. Skipping terraform init."
        fi
    done
else
    echo "Skipping module-specific 'terraform init' for full checkout. Please navigate to modules manually."
    # If full checkout, the user needs to `cd` into a specific module to run init
fi

echo ""
echo "--- Dev Container Setup Complete! ---"
echo "You are now ready to work on your selected modules."
echo "Use 'ls' to see your checked out files."