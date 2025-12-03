# =============================================================================
# F1 Racing Analysis - Jupyter Notebook Container
# =============================================================================

FROM python:3.11-slim

LABEL maintainer="F1 Racing Analysis Project"
LABEL description="Docker container for F1 Racing Analysis with Jupyter Notebook"

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    JUPYTER_ENABLE_LAB=yes \
    JUPYTER_TOKEN=""

WORKDIR /app

# System dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Python dependencies
COPY docker/requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

EXPOSE 8888

HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 \
    CMD curl -f http://localhost:8888/api || exit 1

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=", "--NotebookApp.password=", "--NotebookApp.allow_origin=*"]

