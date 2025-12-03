#!/bin/bash
# =============================================================================
# Start - Launch development environment
# =============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
source "${ROOT_DIR}/lib/utils.sh"

# =============================================================================
# MAIN
# =============================================================================

print_banner "F1 Racing Analysis"

# Pre-flight checks
print_header "Pre-flight Checks"

if ! check_docker; then
    exit 1
fi
success "Docker is running"

if ! check_port 8888; then
    echo "  Stop the existing process or run 'make stop'"
    exit 1
fi
success "Port 8888 is available"

COMPOSE_CMD=$(get_compose_cmd)
if [[ -z "$COMPOSE_CMD" ]]; then
    error "Docker Compose not found"
    exit 1
fi

# Check if image exists
cd "$ROOT_DIR"
if ! docker images | grep -q "f1-analysis-jupyter"; then
    warn "Docker image not found. Running setup first..."
    "${SCRIPT_DIR}/setup.sh"
fi

# Start containers
print_header "Starting Jupyter Notebook"

$COMPOSE_CMD up -d

# Wait for container
sleep 2

if container_running "f1-analysis-jupyter"; then
    print_server_box "http://localhost:8888" "Jupyter Notebook"
    info "Run 'make logs' to view container logs"
    info "Run 'make stop' to stop the server"
else
    error "Container failed to start"
    echo "  Run 'make logs' to see what went wrong"
    exit 1
fi

