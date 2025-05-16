#!/bin/bash
set -e

echo "Building modules"

MODULES=("../../PDFMicroserviceLib" "../../WorkerLib" "../../WorkerManagementService" "../../WorkerServiceNode")

for module in "${MODULES[@]}"; do
    echo "Building $module..."
    (cd "$module" && mvn clean install -DskipTests)
    echo "$module build completed!"
done

echo "All modules built successfully!"
