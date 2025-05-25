FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    sogo mariadb-client gnustep-base-runtime \
    && apt clean && rm -rf /var/lib/apt/lists/*
    
ENTRYPOINT ["sogo-tool"]
