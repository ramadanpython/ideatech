FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Установим базовые утилиты
RUN apt update && apt install -y curl gnupg ca-certificates

# Добавим репозиторий SOGo (Ubuntu 24.04 → noble)
RUN echo "deb https://packages.inverse.ca/SOGo/nightly/5/ubuntu/ noble main" > /etc/apt/sources.list.d/sogo.list

# Импорт GPG-ключа
RUN curl -s https://packages.inverse.ca/SOGo/GPGKEY | gpg --dearmor | tee /etc/apt/trusted.gpg.d/sogo.gpg > /dev/null

# Установим пакеты
RUN apt update && apt install -y \
    sogo \
    mariadb-client \
    gnustep-base-runtime \
    && apt clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["sogo-tool"]
