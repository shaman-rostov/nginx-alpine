#!/usr/bin/env bash
# Serves a static file with the image's default configuration and checks the response.
set -euo pipefail
IMAGE=${1:?image}
dir=$(mktemp -d); echo "ok-$$" > "$dir/index.html"; chmod -R a+rX "$dir"
name=nginx-test-$$
trap 'docker rm -f "$name" >/dev/null 2>&1 || true; rm -rf "$dir"' EXIT
docker run -d --name "$name" -p 127.0.0.1::80 -v "$dir:/usr/share/nginx/html:ro" "$IMAGE" >/dev/null
port=$(docker port "$name" 80/tcp | head -1 | sed 's/.*://')
for _ in $(seq 20); do curl -fsS "http://127.0.0.1:$port/" 2>/dev/null | grep -q "ok-$$" && break; sleep 1; done
curl -fsS "http://127.0.0.1:$port/" | grep -q "ok-$$" || { echo "FAIL: static file not served"; docker logs "$name"; exit 1; }
docker exec "$name" nginx -t 2>&1 | grep -q "test is successful" || { echo "FAIL: nginx -t"; exit 1; }
echo "PASS $(docker exec "$name" nginx -v 2>&1)"
