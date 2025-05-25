FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y gnupg curl lsb-release

# Добавляем SOGo репозиторий
RUN echo "deb https://packages.inverse.ca/SOGo/nightly/5/ubuntu/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/sogo.list && \
    curl -s https://packages.inverse.ca/SOGo/GPGKEY | gpg --dearmor > /etc/apt/trusted.gpg.d/sogo.gpg

# Установка пакетов
RUN apt update && apt install -y \
    sogo \
    mariadb-client \
    gnustep-base-runtime \
    && apt clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["sogo-tool"]
