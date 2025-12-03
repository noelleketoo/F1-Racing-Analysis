#!/bin/bash
# =============================================================================
# Status - Show environment status
# =============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
source "${ROOT_DIR}/lib/utils.sh"

# =============================================================================
# MAIN
# =============================================================================

print_banner "F1 Racing Analysis - Status"

# Docker status
print_header "Docker"

if check_docker 2>/dev/null; then
    success "Docker is running"
else
    error "Docker is not running"
fi

# Container status
print_header "Containers"

if container_running "f1-analysis-jupyter"; then
    success "Jupyter container is running"
    echo ""
    echo "  URL: http://localhost:8888"
else
    info "Jupyter container is not running"
    echo ""
    echo "  Run 'make start' to launch"
fi

# Image status
print_header "Images"

if docker images | grep -q "f1-racing-analysis"; then
    success "Docker image exists"
    docker images | grep "f1-racing-analysis" | head -1 | awk '{print "  " $1 ":" $2 " (" $7 " " $8 ")"}'
else
    info "Docker image not built"
    echo ""
    echo "  Run 'make setup' to build"
fi

echo ""

