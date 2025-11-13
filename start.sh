#!/bin/bash

echo "==========================================="
echo "F1 Racing Analysis - Jupyter Notebook"
echo "==========================================="
echo ""
echo "Starting Jupyter Notebook server..."
echo "The notebook will be available at http://localhost:8888"
echo ""
echo "To access the notebook:"
echo "1. Open your browser and navigate to http://localhost:8888"
echo "2. The notebook is accessible without authentication"
echo ""
echo "Press CTRL+C to stop the server"
echo "==========================================="
echo ""

exec jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token="" --NotebookApp.password="" --NotebookApp.allow_origin="*"

