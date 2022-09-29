FROM python:3

ENV SECRET_KEY=NHF*&Cn8^&R&(sd79as6nds87n(^8r9n7r67s8

RUN apt-get update && apt-get install nginx vim -y --no-install-recommends

RUN mkdir app

COPY . /app/

# Installing dependencies
WORKDIR /app/
RUN pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 8000

# Running Django App
WORKDIR /app/ecommerce/
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
