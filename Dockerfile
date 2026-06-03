FROM python:3.9
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt gunicorn
ENV FLASK_APP=albumy
CMD flask forge && gunicorn app:app --bind 0.0.0.0:10000
