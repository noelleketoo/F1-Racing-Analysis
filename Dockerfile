FROM python:3.11-slim

LABEL maintainer="F1 Racing Analysis Project"
LABEL description="Docker container for F1 Racing Analysis with Jupyter Notebook"

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose Jupyter port
EXPOSE 8888

# Set environment variables for Jupyter
ENV JUPYTER_ENABLE_LAB=yes
ENV JUPYTER_TOKEN=""

# Copy and set permissions for startup script
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# Run the startup script
CMD ["/app/start.sh"]

