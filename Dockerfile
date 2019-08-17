FROM ubuntu:latest
WORKDIR /root
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    cmake \
    python3 \
    binutils-dev \
    libcurl4-openssl-dev \
    zlib1g-dev \
    libdw-dev \
    libiberty-dev \
    curl
ADD install_kcov .
RUN ./install_kcov
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:$PATH"
