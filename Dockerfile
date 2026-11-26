# The official nginx Alpine image with the distribution's fixed packages applied at build time.
# Upstream rebuilds lag behind Alpine security updates (e.g. brotli CVE-2026-111497); the weekly rebuild picks them up.
FROM nginx:1.31.9-alpine@sha256:fb4658584bd9a916ffb6f6e365f97c25cfdb2923801f551ea08356e695f14ff7
RUN apk upgrade --no-cache
