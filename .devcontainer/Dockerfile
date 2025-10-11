# Reference: https://docs.docker.com/reference/dockerfile/
FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    curl \
    git \
    openssh-server \
    zip

RUN curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- --default-toolchain=1.89 -y

ENV PATH="/root/.cargo/bin:${PATH}"

RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
RUN service ssh restart

RUN echo "root:root" | chpasswd

# https://stackoverflow.com/a/63348989
# RUN rustup toolchain install nightly
