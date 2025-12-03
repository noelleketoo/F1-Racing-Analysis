#!/bin/bash
# =============================================================================
# Cleanup - Remove containers, images, and volumes
# =============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
source "${ROOT_DIR}/lib/utils.sh"

# =============================================================================
# MAIN
# =============================================================================

print_banner "F1 Racing Analysis - Cleanup"

COMPOSE_CMD=$(get_compose_cmd)
if [[ -z "$COMPOSE_CMD" ]]; then
    error "Docker Compose not found"
    exit 1
fi

cd "$ROOT_DIR"

# Stop containers
print_header "Stopping Containers"
$COMPOSE_CMD down -v 2>/dev/null || true
success "Containers stopped"

# Remove images
print_header "Removing Images"
docker rmi f1-racing-analysis-jupyter 2>/dev/null && success "Image removed" || info "No image to remove"

# Prune
print_header "Cleaning Up"
docker system prune -f --volumes 2>/dev/null || true
success "Docker resources cleaned"

echo ""
echo "Cleanup complete. Run 'make setup' to rebuild."
echo ""

