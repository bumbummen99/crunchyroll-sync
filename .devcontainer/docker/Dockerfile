# Use codespaces default base container
FROM mcr.microsoft.com/vscode/devcontainers/base:bullseye as base

# Add base software
# - gnupg2: For DevContainer commit signing
RUN apt-get update && \
    apt-get install -y \
        gnupg2  \
    && \
    apt-get clean

# Use base image with common software installed
FROM base

# Add additional software
# - ffmpeg: Dependency of crunchy-cli
RUN apt-get update && \
    apt-get install -y \
        ffmpeg  \
    && \
    apt-get clean

# Add crunchyroll-cli
ARG CRUNCHY_CLI_URL=https://github.com/crunchy-labs/crunchy-cli/releases/download/v3.0.0-dev.14/crunchy-v3.0.0-dev.14_linux

RUN wget -q -O /usr/local/bin/crunchy $CRUNCHY_CLI_URL && \
    chmod +x /usr/local/bin/crunchy
