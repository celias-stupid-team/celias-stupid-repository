# syntax=docker/dockerfile:1
FROM docker.io/devkitpro/devkitarm:20250102 AS base

# install binutils
RUN <<EOF
    rm /var/lib/apt/lists/*
    apt update
    apt upgrade
    apt install --assume-yes build-essential libpng-dev libelf-dev
EOF

# build poryscript
FROM golang:1.19 AS build_poryscript

ARG PORYSCRIPT_VERSION=3.5.2

# install poryscript
ADD https://github.com/huderlem/poryscript.git#${PORYSCRIPT_VERSION} /usr/src/app/
WORKDIR /usr/src/app

RUN <<EOF
    set -eu
    go build -v

    mkdir -p /poryscript
    cp poryscript font_config.json command_config.json install.sh CHANGELOG.md README.md /poryscript/
EOF

# build agbcc
FROM base AS build_agbcc

ARG AGBCC_COMMIT=c3e29198cc6854f948e30bac841b934d22686594

RUN mkdir /usr/src/agbcc
WORKDIR /usr/src/agbcc

# install agbcc
RUN <<EOF
    set -eu

    # shallow clones are nice, but only work with named refs...
    # this is a workaround to clone a single commit
    git init
    git remote add origin https://github.com/pret/agbcc.git
    git fetch --depth=1 origin "${AGBCC_COMMIT}"
    git checkout FETCH_HEAD
EOF

COPY agbcc.patch /tmp/agbcc.patch
RUN git apply /tmp/agbcc.patch

RUN <<EOF
    set -eu
    ./build.sh
    ./install.sh /

    cd ..
    rm -rf agbcc
EOF


FROM base AS final

RUN mkdir -p /tools

COPY --from=build_agbcc /tools/agbcc /tools/agbcc
COPY --from=build_poryscript /poryscript /tools/poryscript

RUN useradd --system --create-home --shell /bin/bash dev
LABEL devcontainer.metadata='[{ "remoteUser": "dev", "updateRemoteUserUID": true }]'
