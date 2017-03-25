# docker build -f docker/alpine/Dockerfile . -t clintonb/credentials:alpine

FROM clintonb/edx-base:alpine
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE credentials.settings.devstack
ENV ENABLE_DJANGO_TOOLBAR 1

WORKDIR /code

COPY Makefile /code/
COPY requirements.txt /code/
COPY package.json /code/
COPY requirements/ /code/requirements/

RUN make requirements
RUN make production-requirements

ADD . /code/

RUN make static
