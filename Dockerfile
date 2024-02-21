# Use the official Python image as a base image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install any dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project directory into the container at /app
COPY . .

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the application
CMD ["gunicorn", "-c", "gunicorn_config.py", "main:app"]
