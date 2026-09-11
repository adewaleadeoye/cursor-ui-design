#!/usr/bin/env python3
"""Validate the cursor-ui-design package. Python 3.9+."""

from __future__ import annotations

import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

REQUIRED = [
    "LICENSE",
    "README.md",
    "skills/ui-design/SKILL.md",
    "skills/ui-design/DESIGN.md",
    "skills/ui-design/color.md",
    "skills/ui-design/operator.md",
    "skills/ui-design/slop.md",
    "skills/ui-design/standards.md",
    "skills/ui-design/tokens.tokens.json",
    "skills/ui-design/repo-rule.mdc",
    "templates/DESIGN.md",
    "templates/tokens.tokens.json",
    "templates/.cursor/rules/ui-design.mdc",
    "templates/user-rule.mdc",
    "examples/saas/DESIGN.md",
    "examples/dashboard/DESIGN.md",
]

LOCAL_PATH = re.compile(
    r"(C:\\\\Users\\|C:/Users/|/Users/[A-Za-z0-9_.-]+/|/home/[A-Za-z0-9_.-]+/)"
)


def fail(msg: str) -> None:
    print(f"FAIL: {msg}", file=sys.stderr)
    sys.exit(1)


def main() -> None:
    missing = [p for p in REQUIRED if not (ROOT / p).is_file()]
    if missing:
        fail("missing files:\n  " + "\n  ".join(missing))

    skill = (ROOT / "skills/ui-design/SKILL.md").read_text(encoding="utf-8")
    if not skill.startswith("---"):
        fail("SKILL.md missing YAML frontmatter")
    if "name: ui-design" not in skill.split("---", 2)[1]:
        fail("SKILL.md frontmatter must include name: ui-design")
    if "description:" not in skill.split("---", 2)[1]:
        fail("SKILL.md frontmatter must include description")

    tokens = json.loads(
        (ROOT / "skills/ui-design/tokens.tokens.json").read_text(encoding="utf-8")
    )
    if "$schema" not in tokens:
        fail("tokens.tokens.json missing $schema")
    if "semantic" not in tokens or "color" not in tokens:
        fail("tokens.tokens.json must have color and semantic layers")

    for path in (ROOT / "skills").rglob("*"):
        if path.suffix.lower() not in {".md", ".mdc", ".json"}:
            continue
        text = path.read_text(encoding="utf-8")
        if LOCAL_PATH.search(text):
            fail(f"machine-local path in {path.relative_to(ROOT)}")

    design = (ROOT / "skills/ui-design/DESIGN.md").read_text(encoding="utf-8")
    if "Approved token freeze" not in design:
        fail("skill DESIGN.md must include an Approved token freeze heading")

    print("ok")


if __name__ == "__main__":
    main()
