#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /petlove/tmp/pids/server.pid

bundle check || bundle install --binstubs="$BUNDLE_BIN"

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"