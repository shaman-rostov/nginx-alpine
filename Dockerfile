# The official nginx Alpine image with the distribution's fixed packages applied at build time.
# Upstream rebuilds lag behind Alpine security updates (e.g. brotli CVE-2026-111497); the weekly rebuild picks them up.
FROM nginx:1.31.8-alpine@sha256:785835ea65db4bba6f021acc0f3be91b0fef76a53fe41f8588c6698d2aed0606
RUN apk upgrade --no-cache
