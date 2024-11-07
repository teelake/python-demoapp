FROM python:3.9-slim

LABEL Name="Python Flask Demo App" Version=1.4.2
LABEL org.opencontainers.image.source = "https://github.com/teelake/python-demoapp"

ARG srcDir=src
WORKDIR /app
COPY $srcDir/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY $srcDir/run.py .
COPY $srcDir/app ./app

EXPOSE 5000

# Start the app with gunicorn
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:5000"]


