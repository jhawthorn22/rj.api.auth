FROM python:3

ARG port=5000
ARG secret="justasecret"
ARG app_settings="api.server.config.ProductionConfig"

ENV SECRET_KEY ${secret}
ENV APP_SETTINGS ${app_settings}

WORKDIR /usr/src/app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

EXPOSE ${port}
CMD [ "python", "manage.py", "runserver" ]