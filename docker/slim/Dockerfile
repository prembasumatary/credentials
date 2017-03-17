FROM clintonb/edx-base:slim
ENV PYTHONUNBUFFERED 1
ENV CREDENTIALS_CFG /edx/etc/credentials.yml
ENV DJANGO_SETTINGS_MODULE credentials.settings.devstack
ENV ENABLE_DJANGO_TOOLBAR 1

WORKDIR /code

RUN mkdir -p /edx/var/credentials/media /edx/var/credentials/staticfiles

COPY docker/credentials.yml ${CREDENTIALS_CFG}
COPY Makefile /code/
COPY requirements.txt /code/
COPY package.json /code/
COPY requirements/ /code/requirements/

RUN make requirements
RUN make production-requirements

ADD . /code/

RUN make static
