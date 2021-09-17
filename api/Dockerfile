#!/usr/bin/env bash
FROM python:3.8

# Set work directory.
WORKDIR /opt/app

# Copy entire project into work directory
COPY . /opt/app

# Install dependencies.
RUN python3 -m pip install --user --no-cache-dir -r requirements.txt

EXPOSE 5000

# Run the application
CMD ["python3", "/opt/app/api/app.py"]