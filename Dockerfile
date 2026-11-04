
# Use Python as the base image
FROM python:3.12-slim

# Set the working directory
WORKDIR /app

# Copy requirements
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application files
COPY . .

# Expose Flask port
EXPOSE 5000

# Start the Flask application
CMD ["python", "app.py"]
