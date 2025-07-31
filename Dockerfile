FROM ubuntu:jammy

ENV DEBIAN_FRONTEND=noninteractive

# Install Rust and essential build tools
RUN apt-get update && apt-get install -y \
      curl \
      build-essential \
      pkg-config \
      libssl-dev \
      libcurl4-openssl-dev \
      git \
      ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install Rust using rustup
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Install additional Rust tools
RUN rustup component add rustfmt clippy rust-analyzer

# Install cargo-watch for development
RUN cargo install cargo-watch

# Install cargo-audit for security scanning
RUN cargo install cargo-audit

# Install cargo-tarpaulin for code coverage
RUN cargo install cargo-tarpaulin

# Install cargo-nextest for testing
RUN cargo install cargo-nextest
