#!/bin/bash
set -eu

export NODE_VERSION=${NODEVERSION:-"22.19.0"}
export INSTALL_PACKAGES=${INSTALLPACKAGES:-""}

get_arch() {
    case $(uname -m) in
        x86_64) echo "x64" ;;
        aarch64) echo "arm64" ;;
        armv7l) echo "armv7l" ;;
        *) echo "unknown" ;;
    esac
}

update_rc() {
    local RC_FILE=/etc/bash.bashrc
    if [[ "$(cat $RC_FILE)" != *"$1"* ]]; then
        echo "$1" >> $RC_FILE
    fi
}

# Install dependencies
if ! command -v curl >/dev/null 2>&1; then
    export DEBIAN_FRONTEND=noninteractive
    apt-get update && apt-get install -y curl ca-certificates xz-utils
    rm -rf /var/lib/apt/lists/*
fi

# Install node
echo "Downloading Node.js v${NODE_VERSION}..."
ARCH=$(get_arch)
URL="https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-${ARCH}.tar.xz"
curl -fsSL "$URL" -o /tmp/node.tar.xz
mkdir -p /usr/local/lib/nodejs
tar Jxfv /tmp/node.tar.xz -C /usr/local/lib/nodejs
rm /tmp/node.tar.xz
ln -s /usr/local/lib/nodejs/node-v${NODE_VERSION}-linux-${ARCH} /usr/local/lib/nodejs/current
update_rc 'export PATH=/usr/local/lib/nodejs/current/bin:$PATH'
export PATH=/usr/local/lib/nodejs/current/bin:$PATH

# Install packages
if [ -n "${INSTALL_PACKAGES}" ]; then
    npm install --global ${INSTALL_PACKAGES}
fi
