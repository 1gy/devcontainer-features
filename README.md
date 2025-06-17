# Dev Container Features

## Contents

### [`node-pnpm`](./src/node-pnpm)

Installs Node.js and pnpm.

### [`lightpanda`](./src/lightpanda)

Installs [Lightpanda](https://github.com/lightpanda-io/browser).

## Testing

```bashrc
# Test the feature
devcontainer features test -f node-pnpm --base-image ubuntu
devcontainer features test -f lightpanda --base-image ubuntu
```
