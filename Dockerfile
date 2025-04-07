FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl unzip python3-pip ansible git sudo \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://releases.hashicorp.com/packer/1.9.2/packer_1.9.2_linux_amd64.zip -o packer.zip \
    && unzip packer.zip \
    && mv packer /usr/local/bin/ \
    && rm packer.zip

WORKDIR /workspace