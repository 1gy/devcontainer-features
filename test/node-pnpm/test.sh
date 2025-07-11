#!/bin/bash
set -e

# Import test library
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
source dev-container-features-test-lib

# Definition specific tests
check "pnpm store path" bash -c 'pnpm store path | grep -q "$HOME/.pnpm-store"'
check "node version" node --version
check "pnpm version" pnpm --version

# Report result
reportResults
