# cursor-ui-design

A visual-contract and verification system for [Cursor](https://cursor.com) agents.

It helps coding agents produce more consistent, accessible, and less generic UI. It does **not** promise one-shot perfect design. The loop is:

**seed → token freeze → existing components → browser check → slop and contrast checks**

Inspired by how Claude Design works (a locked system, then looking at pixels) — packaged so Cursor can use the same ideas without depending on one model.

## What you get

| Piece | Role |
|---|---|
| `skills/ui-design/` | Personal Cursor skill: lookup order, color seeding, WCAG, slop kits |
| `templates/` | Project `DESIGN.md`, DTCG tokens, `.cursor/rules/ui-design.mdc` |
| `examples/` | SaaS and dashboard overlays |

## Install the skill

Copies into `~/.cursor/skills/ui-design` (Windows, macOS, Linux).

```powershell
pwsh -File scripts/install-skill.ps1 -WithUserRule
```

```bash
chmod +x scripts/install-skill.sh
./scripts/install-skill.sh --with-user-rule
```

`-WithUserRule` / `--with-user-rule` also installs `templates/user-rule.mdc` as `~/.cursor/rules/ui-design.mdc`.

## Init a project

```powershell
pwsh -File scripts/init-project.ps1 -Target C:\path\to\app
```

```bash
./scripts/init-project.sh /path/to/app
```

Writes (skips existing files unless `--force` / `-Force`):

- `DESIGN.md`
- `tokens/core.tokens.json`
- `.cursor/rules/ui-design.mdc`

Then replace the placeholders. The starter blues are not a brand.

## How to prompt color

Two fills are enough. Optional third shade is **ink** (text), not another background.

```
Shade 1 (page): #E4D191
Shade 2 (action): #C7361F
Ink: #1C1917
```

The agent expands these to a freeze (`oklch` tokens), derives readable text colors, and pastes a contrast pairing table. Gradients are **input only** — they do not become the UI.

Sharing a hue family with another theme is fine when you say why. Copying the whole identity (tokens + type + chrome + rhythm) without a reason is not.

## Verify

User-visible UI: exercise the real page at **375 / 768 / 1440**. A single screenshot is not enough.

Figma MCP and Playwright are optional. The running app is the canvas.

## Checks

```bash
python scripts/check.py
```

## What this is not

- Not TypeUI, UIUX Pro Max, or a prompt pack
- Not a controlled model benchmark
- Not a substitute for a real design team on a large product

## License

MIT. See [LICENSE](LICENSE).
