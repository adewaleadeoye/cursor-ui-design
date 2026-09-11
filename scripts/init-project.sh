#!/usr/bin/env bash
# Copy DESIGN.md, tokens, and the project Cursor rule into a target repo.
# Usage: ./scripts/init-project.sh /path/to/app [--force]
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="${1:-}"
FORCE="${2:-}"

if [[ -z "$TARGET" || ! -d "$TARGET" ]]; then
  echo "Usage: $0 /path/to/app [--force]" >&2
  exit 1
fi

TARGET="$(cd "$TARGET" && pwd)"

copy_template() {
  local rel_src="$1"
  local rel_dest="$2"
  local to="$TARGET/$rel_dest"
  mkdir -p "$(dirname "$to")"
  if [[ -e "$to" && "$FORCE" != "--force" ]]; then
    echo "skip (exists): $rel_dest"
    return
  fi
  cp "$ROOT/$rel_src" "$to"
  echo "wrote $rel_dest"
}

copy_template "templates/DESIGN.md" "DESIGN.md"
copy_template "templates/tokens.tokens.json" "tokens/core.tokens.json"
copy_template "templates/.cursor/rules/ui-design.mdc" ".cursor/rules/ui-design.mdc"

echo "Replace placeholder values in DESIGN.md. Do not ship the starter blues as a brand."
