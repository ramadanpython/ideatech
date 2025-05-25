FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Включаем universe
RUN sed -i 's/^# deb/deb/g' /etc/apt/sources.list && \
    apt update && apt install -y \
    software-properties-common && \
    add-apt-repository universe

# Устанавливаем пакеты
RUN apt update && apt install -y \
    sogo \
    mariadb-client \
    gnustep-base-runtime \
    && apt clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["sogo-tool"]
