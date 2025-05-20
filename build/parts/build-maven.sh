#!/bin/bash
set -e

echo "Building modules"

MODULES=("../../PDF-Microservices-Main-Libary" "../../PDF-Microservices-Worker-Libary" "../../PDF-Microservices-Worker-Management-Service" "../../PDF-Microservices-Worker-Service")

for module in "${MODULES[@]}"; do
    echo "Building $module..."
    (cd "$module" && mvn clean install -DskipTests)
    echo "$module build completed!"
done

echo "All modules built successfully!"
