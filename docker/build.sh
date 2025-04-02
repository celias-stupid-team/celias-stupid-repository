#!/bin/sh
NAME=celias-stupid-docker-image
VERSION=1

cd "$(dirname "$0")"
docker build --tag "${NAME}:${VERSION}" .
