FROM python:3.9-slim

LABEL Name="Python Flask Demo App" Version=1.4.2
LABEL org.opencontainers.image.source="https://github.com/teelake/python-demoapp"

ARG srcDir=src
WORKDIR /app

# Copy requirements and install dependencies
COPY $srcDir/requirements.txt .
# Install dependencies, including gunicorn
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install gunicorn

# Copy application code
COPY $srcDir/run.py .
COPY $srcDir/app ./app

EXPOSE 5000

# Start the app with Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:5000", "run:app"]
