# nginx-alpine

`ghcr.io/shaman-rostov/nginx-alpine:<version>`: the official `nginx:<version>-alpine` pinned by digest, with
`apk upgrade` applied, rebuilt weekly. A drop-in replacement for the official image (same configuration, paths, user
and entrypoint) for the static sites on the oracle host. CI serves a static file before publishing.
