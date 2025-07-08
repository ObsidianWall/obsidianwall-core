# File: ObsidianWall_SIaC/scripts/validate-ci-health.sh

#!/bin/bash

# Purpose: Checks if all modules have proper CI coverage (security and validate)
# ✅ Description: Verifies if each terraform module is registered in validate and CI workflows.

echo "🔍 Validating CI Coverage for Terraform Modules..."

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MODULE_DIR="$ROOT_DIR/modules"
CI_SECURITY_FILE="$ROOT_DIR/../.github/workflows/ci-security.yml"
VALIDATE_FILE="$ROOT_DIR/../.github/workflows/validate-terraform.yml"

missing_in_ci_security=()
missing_in_validate=()

for module_path in "$MODULE_DIR"/*/; do
    module_name=$(basename "$module_path")

    grep -q "$module_name" "$CI_SECURITY_FILE"
    if [[ $? -ne 0 ]]; then
        missing_in_ci_security+=("$module_name")
    fi

    grep -q "$module_name" "$VALIDATE_FILE"
    if [[ $? -ne 0 ]]; then
        missing_in_validate+=("$module_name")
    fi
done

echo ""
if [ ${#missing_in_ci_security[@]} -eq 0 ]; then
    echo "✅ All modules are listed in ci-security.yml"
else
    echo "❌ Missing from ci-security.yml:"
    for m in "${missing_in_ci_security[@]}"; do echo "  - $m"; done
fi

if [ ${#missing_in_validate[@]} -eq 0 ]; then
    echo "✅ All modules are listed in validate-terraform.yml"
else
    echo "❌ Missing from validate-terraform.yml:"
    for m in "${missing_in_validate[@]}"; do echo "  - $m"; done
fi

exit 0
