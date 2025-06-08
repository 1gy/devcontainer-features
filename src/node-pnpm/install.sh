#!/bin/sh
set -eu

export NODE_VERSION=${NODEVERSION:-"lts"}
export PNPM_VERSION=${PNPMVERSION:-""}
export INSTALL_PACKAGES=${INSTALLPACKAGES:-""}

# Install dependencies
if ! command -v curl >/dev/null 2>&1; then
    export DEBIAN_FRONTEND=noninteractive
    apt-get update && apt-get install -y curl ca-certificates
    rm -rf /var/lib/apt/lists/*
fi

su - ${_REMOTE_USER} << EOF
set -euo pipefail

# Install pnpm
curl -fsSL https://get.pnpm.io/install.sh | env PNPM_HOME="\${HOME}/.pnpm" PNPM_VERSION="${PNPM_VERSION}" bash -

export PNPM_HOME="\${HOME}/.pnpm"
export PATH="\${PNPM_HOME}:\${PATH}"

# Install node
pnpm env use --global ${NODE_VERSION}

# Install packages
if [ -n "${INSTALL_PACKAGES}" ]; then
    pnpm install --global ${INSTALL_PACKAGES}
fi
EOF
