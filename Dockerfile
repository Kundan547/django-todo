# Use a specific version of Python 3 for consistency
FROM python:3.8-slim

# Set the working directory inside the container
WORKDIR /data

# Install system dependencies for Python and distutils
RUN apt-get update && apt-get install -y python3-distutils python3-pip && apt-get clean

# Install Django (you can lock the version as needed)
RUN pip install django==3.2

# Copy all the application files into the container
COPY . .

# Run database migrations
RUN python manage.py migrate || true

# Expose port 8000 for the application
EXPOSE 8000

# Default command to run the application
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
