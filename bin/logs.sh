#!/bin/bash
# =============================================================================
# Logs - Show container logs
# =============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
source "${ROOT_DIR}/lib/utils.sh"

# =============================================================================
# MAIN
# =============================================================================

COMPOSE_CMD=$(get_compose_cmd)
if [[ -z "$COMPOSE_CMD" ]]; then
    error "Docker Compose not found"
    exit 1
fi

cd "$ROOT_DIR"

if container_running "f1-analysis-jupyter"; then
    $COMPOSE_CMD logs -f
else
    error "Container is not running"
    echo "  Run 'make start' first"
    exit 1
fi

