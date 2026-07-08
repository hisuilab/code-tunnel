FROM ubuntu:22.04

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV EDITOR=nano

RUN apt-get update && apt-get install -y --no-install-recommends \
      curl ca-certificates git less nano \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m -s /bin/bash tunnel

USER tunnel
WORKDIR /home/tunnel

RUN ARCH=$(dpkg --print-architecture) \
    && case "$ARCH" in \
         amd64) CLI_OS=cli-alpine-x64 ;; \
         arm64) CLI_OS=cli-alpine-arm64 ;; \
         *) echo "unsupported arch: $ARCH" && exit 1 ;; \
       esac \
    && curl -Lk "https://code.visualstudio.com/sha/download?build=stable&os=${CLI_OS}" -o vscode_cli.tar.gz \
    && tar -xf vscode_cli.tar.gz \
    && rm vscode_cli.tar.gz

ENTRYPOINT ["/home/tunnel/code", "tunnel", "--accept-server-license-terms"]
