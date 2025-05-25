FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Установим curl, gnupg и ca-certificates
RUN apt update && apt install -y curl gnupg ca-certificates

# Добавим репозиторий SOGo
RUN echo "deb https://packages.inverse.ca/SOGo/nightly/5/ubuntu/ noble main" > /etc/apt/sources.list.d/sogo.list

# Добавим GPG-ключ
RUN curl -s https://packages.inverse.ca/SOGo/GPGKEY | gpg --dearmor -o /etc/apt/trusted.gpg.d/sogo.gpg

# Установим нужные пакеты
RUN apt update && apt install -y \
    sogo \
    mariadb-client \
    gnustep-base-runtime \
    && apt clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["sogo-tool"]
