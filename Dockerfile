FROM python:3.9.6-slim

ADD ./src/requirements.txt /src/

RUN sed -i "s/deb.debian.org/mirror.ps.kz/g" \
    /etc/apt/sources.list \
    && apt update \
    && apt install -y apt-utils \
# Upgrade pip
    && pip install --upgrade pip \
# Add project dependencies
    && pip install \
    --no-cache-dir -Ur /src/requirements.txt \
# Remove build dependencies
    && apt clean

COPY ./src /src
WORKDIR /src
CMD ["./entrypoint.sh"]

