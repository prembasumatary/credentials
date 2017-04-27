# docker build . -t clintonb/credentials:slim

FROM clintonb/edx-base:slim
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE credentials.settings.devstack
ENV ENABLE_DJANGO_TOOLBAR 1

WORKDIR /code

# Iceweasel is the Debian name for Firefox
RUN apt-get update && apt-get install -y \
    iceweasel \
    xvfb

COPY Makefile /code/
COPY requirements.txt /code/
COPY package.json /code/
COPY requirements/ /code/requirements/

RUN make requirements
RUN make production-requirements

ADD . /code/

RUN make static
