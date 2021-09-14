# Pull python 3 image from docker hub
FROM python:3

# Set work directory.
RUN mkdir /opt/app
WORKDIR /opt/app

# Copy entire project into work directory
COPY . /opt/app

COPY requirements.txt /opt/app

# Install dependencies.
RUN python3 -m pip install --user --no-cache-dir -r requirements.txt

# Run the application
CMD ["python", "api/app.py"]