#!/usr/bin/env bash
# Push whatever has changed. Run from anywhere inside the repo.
set -e
cd "$(dirname "$0")"
if [[ -z $(git status --porcelain) ]]; then
  echo "Nothing to sync."
  exit 0
fi
git add -A
git commit -m "${1:-sync $(date '+%Y-%m-%d %H:%M')}"
git push
echo "Synced."
