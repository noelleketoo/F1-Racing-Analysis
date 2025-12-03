# =============================================================================
# F1 Racing Analysis - Makefile
# =============================================================================

.PHONY: help setup start stop status logs clean

help:
	@echo ""
	@echo "F1 Racing Analysis"
	@echo "============================================================"
	@echo ""
	@echo "Setup"
	@echo "  make setup          Build Docker image (one-time)"
	@echo "  make status         Show environment status"
	@echo "  make clean          Remove containers and images"
	@echo ""
	@echo "Development"
	@echo "  make start          Start Jupyter Notebook"
	@echo "  make stop           Stop all containers"
	@echo "  make logs           View container logs"
	@echo ""

setup:
	@./bin/setup.sh

start:
	@./bin/start.sh

stop:
	@./bin/stop.sh

status:
	@./bin/status.sh

logs:
	@./bin/logs.sh

clean:
	@./bin/cleanup.sh

