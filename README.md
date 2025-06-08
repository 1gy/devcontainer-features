# Dev Container Features

## Contents

### `node-pnpm`

This Feature installs Node.js and the pnpm package manager. You can specify versions for Node.js and pnpm, and optionally list npm packages to be installed globally.

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/1gy/devcontainer-features/node-pnpm:1": {
            "nodeVersion": "lts",
            "pnpmVersion": "",
            "installPackages": "typescript eslint"
        }
    }
}
```

## Requirements

This Feature requires `apt-get` to be available in the base image for installing necessary dependencies.

## Testing

```bashrc
# Test the feature
devcontainer features test -f node-pnpm
```
