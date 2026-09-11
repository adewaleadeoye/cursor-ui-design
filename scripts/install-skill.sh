#!/usr/bin/env bash
# Copy the ui-design skill into the current user's Cursor skills folder.
# Usage: ./scripts/install-skill.sh [--with-user-rule]
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/skills/ui-design"
DEST="${HOME}/.cursor/skills/ui-design"

if [[ ! -d "$SRC" ]]; then
  echo "Skill not found at $SRC" >&2
  exit 1
fi

mkdir -p "$(dirname "$DEST")"
rm -rf "$DEST"
cp -R "$SRC" "$DEST"
echo "Installed skill -> $DEST"

if [[ "${1:-}" == "--with-user-rule" ]]; then
  RULE_DIR="${HOME}/.cursor/rules"
  mkdir -p "$RULE_DIR"
  cp "$ROOT/templates/user-rule.mdc" "$RULE_DIR/ui-design.mdc"
  echo "Installed user rule -> $RULE_DIR/ui-design.mdc"
fi
