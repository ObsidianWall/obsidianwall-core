
# File: ObsidianWall_SIaC/scripts/auto-patch-ci.py

# Purpose: Auto-inject missing modules into both workflows.


import os
import yaml

BASE_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
MODULES_DIR = os.path.join(BASE_DIR, 'modules')
WORKFLOWS_DIR = os.path.join(BASE_DIR, '..', '.github', 'workflows')

def get_modules():
    return sorted([d for d in os.listdir(MODULES_DIR) if os.path.isdir(os.path.join(MODULES_DIR, d))])

def update_matrix(file_path, job_name):
    with open(file_path, 'r') as f:
        data = yaml.safe_load(f)

    modules = get_modules()
    matrix = data['jobs'][job_name]['strategy']['matrix']['module']

    updated = False
    for mod in modules:
        path = f"ObsidianWall_SIaC/modules/{mod}"
        if path not in matrix:
            matrix.append(path)
            updated = True
            print(f"➕ Added {path} to {os.path.basename(file_path)}")

    if updated:
        with open(file_path, 'w') as f:
            yaml.dump(data, f, sort_keys=False)
        print(f"✅ Updated {file_path}")
    else:
        print(f"✅ No updates needed for {file_path}")

if __name__ == "__main__":
    update_matrix(os.path.join(WORKFLOWS_DIR, 'ci-security.yml'), 'security-scan')
    update_matrix(os.path.join(WORKFLOWS_DIR, 'validate-terraform.yml'), 'terraform-validate')
