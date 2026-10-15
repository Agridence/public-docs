#!/usr/bin/env bash
# Public documentation assets are served from https://assets.agridence.com.
# Linking straight to the backing GCS bucket bypasses that host, so reviewers
# ask for those URLs to be rewritten (Agridence/public-docs#31, r1886522961):
#   https://storage.googleapis.com/agd-public-assets/<path>
#   -> https://assets.agridence.com/<path>
# This check fails if any tracked file still links to the bucket directly.
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

pattern='storage\.googleapis\.com/agd-public-assets|agd-public-assets\.storage\.googleapis\.com|storage\.cloud\.google\.com/agd-public-assets'

set +e
matches="$(git grep -nIiE "$pattern" -- . ':(exclude)scripts/check-asset-hosts.sh')"
status=$?
set -e

case "$status" in
  0)
    printf '%s\n' "$matches"
    while IFS=: read -r file line _; do
      echo "::error file=${file},line=${line}::Direct link to the agd-public-assets bucket; use https://assets.agridence.com/<path> instead."
    done <<<"$matches"
    echo "Found direct links to the agd-public-assets bucket. Replace https://storage.googleapis.com/agd-public-assets with https://assets.agridence.com." >&2
    exit 1
    ;;
  1)
    echo "No direct agd-public-assets bucket links found."
    ;;
  *)
    echo "git grep failed with exit status ${status}" >&2
    exit "$status"
    ;;
esac
