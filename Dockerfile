FROM --platform=linux/amd64 python:3.9-alpine
#FROM --platform=linux/amd64 python:3.8
WORKDIR /opt/app

COPY requirements.txt .
RUN pip install -r requirements.txt
COPY app.py .
RUN adduser -D app && chown -R app /opt/app
USER app
EXPOSE 5000
CMD ["python", "/opt/app/app.py"]