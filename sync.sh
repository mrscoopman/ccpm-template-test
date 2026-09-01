#!/usr/bin/env bash
# Push whatever has changed. Run from anywhere inside the repo.
set -e
cd "$(dirname "$0")"
if [[ -z $(git status --porcelain) ]]; then
  # Working tree is clean, but there may still be commits that never pushed.
  if ! upstream=$(git rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null); then
    echo "Nothing to commit, and no upstream is set for this branch."
    echo "Set one with: git push -u origin $(git rev-parse --abbrev-ref HEAD)"
    exit 1
  fi
  ahead=$(git rev-list --count "@{u}..HEAD")
  if [[ "$ahead" -gt 0 ]]; then
    echo "Nothing to commit, but $ahead commit(s) ahead of $upstream. Pushing."
    git push
    echo "Synced."
    exit 0
  fi
  echo "Nothing to sync."
  exit 0
fi
git add -A
git commit -m "${1:-sync $(date '+%Y-%m-%d %H:%M')}"
git push
echo "Synced."
