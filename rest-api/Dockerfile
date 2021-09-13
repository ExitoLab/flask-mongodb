# Pull python 3 image from docker hub
FROM python:3

# Create a working directory
WORKDIR /app

# Copy requirements.txt into the working directory to install dependencies
COPY requirements.txt ./

# Install all requirements in the requirements.txt file 
RUN python3 -m pip install --user --no-cache-dir -r requirements.txt

# Copy entire project into work directory
COPY . .

# Run the application
CMD ["python", "app.py"] 