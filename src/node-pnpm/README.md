
# Node.js with pnpm (node-pnpm)

Installs Node.js and pnpm package manager

## Example Usage

```json
"features": {
    "ghcr.io/1gy/devcontainer-features/node-pnpm:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| nodeVersion | Select or enter a Node.js version to install. Use 'lts' for latest LTS, or specify exact version (e.g., '22.16.0'). | string | lts |
| pnpmVersion | Select or enter a pnpm version to install. Leave empty for the latest version, or specify exact version (e.g., '10.11.1'). | string | - |
| installPackages | Optional space-separated list of npm packages to install globally using pnpm (e.g., 'typescript eslint prettier'). | string | - |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/1gy/devcontainer-features/blob/main/src/node-pnpm/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
