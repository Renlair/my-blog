#!/bin/sh
set -eu
cd "$(dirname "$0")"
# Explicit production/custom domain takes priority; Pages supplies a deployment URL otherwise.
: "${KITE_SITE_BASEURL:=${CF_PAGES_URL:-}}"
if [ -z "$KITE_SITE_BASEURL" ]; then
  echo 'Set KITE_SITE_BASEURL to the public HTTPS site URL.' >&2
  exit 1
fi
export KITE_SITE_BASEURL
exec sh ./kitew build --verify
