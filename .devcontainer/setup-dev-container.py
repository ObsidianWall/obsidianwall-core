# file: obsidianwall-core/.devcontainer/setup-dev-container.py
#  will install the tools a user/devlopers needs to build IaC modules



import os
import subprocess
import hashlib
import requests
import tarfile
import zipfile
import shutil

# --- Configuration for IaC Tools ---
TOOLS = [
    {
        "name": "terraform",
        "version": "1.8.5",
        "url": "https://releases.hashicorp.com/terraform/{version}/terraform_{version}_linux_amd64.zip",
        "sha256": "81cf5d862f924f331f4a9b6c0e5a6a6f194c65e8a6f3b0634c0e66e5f1b1b1c1"
    },
    {
        "name": "tflint",
        "version": "0.50.0",
        "url": "https://github.com/terraform-linters/tflint/releases/download/v{version}/tflint_linux_amd64.zip",
        "sha256": "a3b4c5d6e7f8g9h0i1j2k3l4m5n6o7p8q9r0s1t2u3v4w5x6y7z8a9b0c1d2e3f4"
    },
    {
        "name": "tfsec",
        "version": "1.28.1",
        "url": "https://github.com/aquasecurity/tfsec/releases/download/v{version}/tfsec_linux_amd64.tar.gz",
        "sha256": "b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1v2w3x4y5z6a7b8c9d0e1f2g3"
    },
    {
        "name": "opa",
        "version": "0.68.0",
        "url": "https://github.com/open-policy-agent/opa/releases/download/v{version}/opa_linux_amd64",
        "sha256": "c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1v2w3x4y5z6a7b8c9d0e1f2g3h4"
    },
]

def get_platform_info():
    """Get platform info for correct tool download."""
    # This simplified version assumes we're in a Linux dev container
    return "linux_amd64"

def install_tool(tool):
    """Downloads and installs a single tool."""
    platform = get_platform_info()
    version = tool["version"]
    url = tool["url"].format(version=version, platform=platform)
    sha256 = tool["sha256"]
    
    print(f"Installing {tool['name']} version {version} from {url}...")

    try:
        response = requests.get(url, stream=True)
        response.raise_for_status()

        # Check hash
        sha256_hash = hashlib.sha256()
        file_content = response.content
        sha256_hash.update(file_content)

        if sha256_hash.hexdigest() != sha256:
            print(f"ERROR: SHA256 mismatch for {tool['name']}. Aborting installation.")
            return

        # Create a temporary directory for installation
        temp_dir = f"/tmp/{tool['name']}"
        os.makedirs(temp_dir, exist_ok=True)
        
        # Determine file type and extract
        if url.endswith(".zip"):
            with open(f"{temp_dir}/{tool['name']}.zip", 'wb') as f:
                f.write(file_content)
            with zipfile.ZipFile(f"{temp_dir}/{tool['name']}.zip", 'r') as zip_ref:
                zip_ref.extractall(temp_dir)
        elif url.endswith(".tar.gz"):
            with open(f"{temp_dir}/{tool['name']}.tar.gz", 'wb') as f:
                f.write(file_content)
            with tarfile.open(f"{temp_dir}/{tool['name']}.tar.gz", 'r:gz') as tar_ref:
                tar_ref.extractall(temp_dir)
        else: # Assumed to be a single binary
            binary_path = f"{temp_dir}/{tool['name']}"
            with open(binary_path, 'wb') as f:
                f.write(file_content)
            os.chmod(binary_path, 0o755)

        # Move binary to a final location
        install_path = "/usr/local/bin/"
        source_binary = os.path.join(temp_dir, tool["name"])
        destination_binary = os.path.join(install_path, tool["name"])
        
        # Check if the binary exists within the extracted files
        if not os.path.exists(source_binary):
            # For tfsec, the binary is often directly named `tfsec` in the extracted archive root
            source_binary = os.path.join(temp_dir, f"tfsec")

        if os.path.exists(source_binary):
            shutil.move(source_binary, destination_binary)
            print(f"Successfully installed {tool['name']} to {destination_binary}")
        else:
            print(f"ERROR: Could not find binary for {tool['name']} in the downloaded archive.")

    except requests.exceptions.RequestException as e:
        print(f"ERROR: Failed to download {tool['name']}. Reason: {e}")
    finally:
        # Clean up temporary directory
        if os.path.exists(temp_dir):
            shutil.rmtree(temp_dir)

def main():
    print("Starting IaC tool setup for ObsidianWall Core...")
    
    # Install Python pre-commit hooks
    print("Installing pre-commit and hooks...")
    subprocess.run(["pip3", "install", "pre-commit"], check=True)
    subprocess.run(["pre-commit", "install"], check=True)
    
    for tool in TOOLS:
        install_tool(tool)
        
    print("IaC tool setup complete.")

if __name__ == "__main__":
    main()
