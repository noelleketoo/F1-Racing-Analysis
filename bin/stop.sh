#!/bin/bash
# =============================================================================
# Stop - Stop all containers
# =============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
source "${ROOT_DIR}/lib/utils.sh"

# =============================================================================
# MAIN
# =============================================================================

print_header "Stopping Containers"

COMPOSE_CMD=$(get_compose_cmd)
if [[ -z "$COMPOSE_CMD" ]]; then
    error "Docker Compose not found"
    exit 1
fi

cd "$ROOT_DIR"
$COMPOSE_CMD down

success "All containers stopped"

