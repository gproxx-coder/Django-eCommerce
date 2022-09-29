FROM python:3

ENV SECRET_KEY=NHF*&Cn8^&R&(sd79as6nds87n(^8r9n7r67s8

RUN apt-get update && apt-get install nginx vim -y --no-install-recommends

RUN mkdir app

COPY . /app/

# Installing dependencies
WORKDIR /app/
RUN pip install --no-cache-dir -r requirements.txt

# Setting up root app directory
WORKDIR /app/ecommerce/

# Doing migrations
RUN python manage.py makemigrations
RUN python manage.py migrate


# Expose port
EXPOSE 8000

# Running Django App
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
