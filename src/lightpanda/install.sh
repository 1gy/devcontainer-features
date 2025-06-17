#!/bin/sh
set -eu

# Install dependencies
if ! command -v curl >/dev/null 2>&1; then
    export DEBIAN_FRONTEND=noninteractive
    apt-get update && apt-get install -y --no-install-recommends curl ca-certificates
    rm -rf /var/lib/apt/lists/*
fi

curl -L -o /tmp/lightpanda https://github.com/lightpanda-io/browser/releases/download/nightly/lightpanda-x86_64-linux
chmod +x /tmp/lightpanda
install -m 755 /tmp/lightpanda /usr/local/bin/lightpanda
rm /tmp/lightpanda
