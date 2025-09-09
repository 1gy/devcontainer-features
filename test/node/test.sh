#!/bin/bash
set -e

# Import test library
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
source dev-container-features-test-lib

# Definition specific tests
check "node version" node --version
check "npm version" npm --version

# Report result
reportResults
