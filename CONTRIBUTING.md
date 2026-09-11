# Contributing

This repo is a **visual contract + verification loop** for coding agents. Keep it product-agnostic.

## Scope

- Core skill lives in `skills/ui-design/`.
- Product-specific names (storefront presentations, PHP helpers, app CSS tokens) belong in `examples/`, not the skill.
- Do not add TypeUI, UIUX Pro Max, or other prompt-pack catalogs.

## Checks

```bash
python scripts/check.py
```

Required: valid token JSON, SKILL.md frontmatter, no machine-specific home paths.

## PRs

- Small diffs. One concern per PR (color seeding, slop kit, installer).
- If you change freeze rules, update `color.md`, `slop.md`, and the README together.
- Do not promise one-shot perfect UI.

## License

MIT. Do not commit secrets, private screenshots you cannot redistribute, or proprietary component source.
