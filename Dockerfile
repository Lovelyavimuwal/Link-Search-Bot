# FROM python:latest

# RUN apt update && apt upgrade -y
# RUN apt install git curl python3-pip ffmpeg -y

# RUN pip3 install -U pip

# COPY requirements.txt /requirements.txt

# RUN cd /
# RUN pip3 install -U -r requirements.txt
# # RUN pip3 install -r requirements.txt
# RUN pip3 install -U pip && pip3 install -U -r requirements.txt
# RUN mkdir /Link-Search-Bot
# WORKDIR /Link-Search-Bot
# COPY start.sh /start.sh

#chat gpt docker file
# Use a specific Python version for consistency
FROM python:3.11-slim

# Update package lists and install necessary system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    ffmpeg \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    gcc \
    && apt-get clean

# Upgrade pip and install Python dependencies
COPY requirements.txt /requirements.txt
RUN pip install --upgrade pip setuptools wheel \
    && pip install --no-cache-dir -r /requirements.txt

# Create the working directory and set it as the current directory
RUN mkdir /Link-Search-Bot
WORKDIR /Link-Search-Bot

# Copy the start script to the container
COPY start.sh /start.sh

# Make sure the start script is executable
RUN chmod +x /start.sh

# Run the bot using the start script
CMD ["/start.sh"]
