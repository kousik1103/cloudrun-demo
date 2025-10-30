# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.9-slim

# Allow statements and log messages to be sent straight to the console
ENV PYTHONUNBUFFERED True

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY requirement.txt .

# Install any dependencies
RUN pip install --no-cache-dir -r requirement.txt

# Copy the content of the local src directory to the working directory
COPY . .

# Specify the command to run on container startup
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "main:app"]
