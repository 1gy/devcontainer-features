#!/bin/bash
set -e

# Import test library
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
source dev-container-features-test-lib

# Definition specific tests
check "typescript version" tsc --version
check "eslint version" eslint --version
check "prettier version" prettier --version

# Report result
reportResults
