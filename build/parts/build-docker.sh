#!/bin/bash
set -e

echo "Building Docker images"

# Define modules with corresponding Docker tags
declare -A MODULE_TAGS=(
    ["../../WorkerManagementService"]="worker_management_service:latest"
    ["../../WorkerServiceNode"]="worker_service:latest"
)

for module in "${!MODULE_TAGS[@]}"; do
    tag="${MODULE_TAGS[$module]}"

    echo "Building Docker image for $module with tag $tag..."

    # Check if a Dockerfile exists before attempting the build
    if [[ -f "$module/Dockerfile" ]]; then
        (cd "$module" && docker build -t "$tag" .)
        echo "Docker image $tag built successfully!"
    else
        echo "No Dockerfile found in $module, skipping..."
    fi
done

echo "All Docker images built successfully!"
