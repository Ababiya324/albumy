FROM python:3.9-slim
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential libjpeg-dev zlib1g-dev && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt gunicorn
COPY . .
ENV FLASK_APP=albumy
ENV FLASK_CONFIG=production
EXPOSE 10000
CMD flask forge --user 5 --photo 8 --comment 20 --collect 10 --follow 8 && \
    gunicorn app:app --bind 0.0.0.0:10000 --workers 1 --threads 8 --timeout 600
