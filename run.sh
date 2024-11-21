#!/bin/sh
set -e
(
  cd "$(dirname "$0")"
  mix escript.build
  mv elixserve /tmp/elixserve
)
exec /tmp/elixserve "$@"
