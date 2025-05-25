FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y gnupg curl

# Добавляем репозиторий SOGo 5 для Ubuntu 24.04 (noble)
RUN echo "deb https://packages.inverse.ca/SOGo/nightly/5/ubuntu/ noble main" > /etc/apt/sogo.list && \
    curl -s https://packages.inverse.ca/SOGo/GPGKEY | gpg --dearmor > /etc/apt/trusted.gpg.d/sogo.gpg

# Установка нужных пакетов
RUN apt update && apt install -y \
    sogo \
    mariadb-client \
    gnustep-base-runtime \
    && apt clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["sogo-tool"]
