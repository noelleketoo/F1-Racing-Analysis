#!/bin/bash
# =============================================================================
# Setup - One-time environment setup
# =============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
source "${ROOT_DIR}/lib/utils.sh"

# =============================================================================
# MAIN
# =============================================================================

print_banner "F1 Racing Analysis - Setup"

# Step 1: Check Docker
print_header "Pre-flight Checks"

if ! check_docker; then
    exit 1
fi
success "Docker is running"

COMPOSE_CMD=$(get_compose_cmd)
if [[ -z "$COMPOSE_CMD" ]]; then
    error "Docker Compose not found"
    echo "  Install Docker Desktop which includes Docker Compose."
    exit 1
fi
success "Docker Compose available"

# Step 2: Build image
print_header "Building Docker Image"

timer_start
cd "$ROOT_DIR"
$COMPOSE_CMD build
elapsed=$(timer_elapsed)

success "Image built in ${elapsed}"

# Step 3: Done
print_header "Setup Complete"

echo ""
echo "Run 'make start' to launch Jupyter Notebook"
echo ""

