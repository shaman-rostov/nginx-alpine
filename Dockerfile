# The official nginx Alpine image with the distribution's fixed packages applied at build time.
# Upstream rebuilds lag behind Alpine security updates (e.g. brotli CVE-2026-111497); the weekly rebuild picks them up.
FROM nginx:1.31.7-alpine@sha256:892bb2152464f0c5d8972593a5f5afaf8054552580b699d95f8ff4af08c2d33d
RUN apk upgrade --no-cache
