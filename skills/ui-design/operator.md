# Operator prompting (UI)

Agents follow **checkable values**. Adjectives drift. Contradictory briefs cause silent retints.

## Color: seed, then freeze

Read [color.md](color.md). Palettes are **not** exclusive. Overlap with a sibling is fine when the category or a user seed matches. Guard **whole-identity copycat** (tokens + type + chrome + rhythm) without a written reason — not “this hue is taken.”

Do **not** put hue-range vetoes in the prompt unless you are protecting an **already approved freeze** from being retinted.

**First prompt for a new branded surface — color:**

- If the user gave **two shades or a gradient**, say: expand per color.md; paste the freeze into DESIGN.md; do not add a third **fill** hue; do not keep the gradient as UI. Derive **type color** per color.md. Optional third shade is **ink**, not a third fill.
- If they did not: **ask once** for two shades, a gradient, a screenshot, optional ink, or “reuse [sibling] because [reason].” Do not invent a freeze in the same turn as layout CSS.
- If they say pick: propose one non-slop freeze, show `oklch` lines **and** the type pairing table, wait.
- Spec reply must include the color.md pairing table (pass/fail). Fail: move ink L/C, not the seeded fills.

Any family except slop kits. Do not paste the host app’s default primary as a silent brand.

## Freeze identity in the prompt

- Paste the **literal token block** from `DESIGN.md` (`oklch` lines). Say: “These strings must appear unchanged. Do not reinterpret hue.”
- Paste **L-spread** too: “non-ink surfaces ΔL ≥ 0.15; one band uses `--foreground` as background.” Hue-only freezes still produce flat pastel monotone.
- After a freeze is approved, a later pass may **amend L** if `DESIGN.md` says so. It may not change hue family unless the user asked to amend the freeze.

## One job per pass

1. Tokens / regression (diff CSS against the freeze). Stop.
2. Then layout. Do not retouch tokens in pass 2 unless a line is still wrong vs the freeze.

Do not say “fix slop / make it premium” in the same breath as a palette freeze.

## Ban metaphors as the only card rule

“Not marketplace tiles” is not enough. Write chrome:

- border / box-shadow: yes or no
- overlay icon buttons on hover: yes or no
- image to the edge: yes or no
- caption below in flow: yes or no

Name the **file** that implements the card.

## Require a written checklist

Ask the agent to paste pass/fail against the anti-pattern list **in the reply**. Check freeze strings, L-spread, dark-anchor, **type pairing table**, card chrome, copycat, slop kits.

## Require a CSS self-diff

“Diff the token block in theme CSS / CSS variables against the `DESIGN.md` freeze. Flag every unintended change (radius, font, spacing too).”

## New branded surface (landing, theme, marketing home)

Do **not** start with “build a [category] theme.” Sequence:

1. **Spec pass** — `DESIGN.md` only. Color from a **seed** (two shades / gradient / sibling + reason) expanded per color.md, or ask. Plus L-spread, dark-anchor, card chrome, section intent, done checklist. No CSS.
2. **Wire pass** — tokens from the freeze; reuse existing primitives; scoped CSS if the project already scopes themes.
3. **Craft pass** — dark-anchor band, L-spread, named leftover sections. Diff tokens vs freeze. Paste the checklist.

Never combine “don’t look like X” with a second color veto unless you are locking an approved freeze.

### What must be in the first prompt (checkable)

| Item | What to put |
|---|---|
| Surface | `marketing` \| `app` \| `data` \| `form` \| `media` |
| Color seed | Two shades, a gradient, optional ink, “reuse [sibling] because…”, or “ask the user” |
| Type color | Derive ink unless seeded; paste pairing table; do not use primary as body |
| Token freeze | Full `oklch` block in DESIGN.md (after expand / approval) |
| L-spread | Non-ink ΔL ≥ 0.15; ink used as a **fill** once on marketing pages |
| Card chrome | Border/shadow/overlay icons yes/no; aspect; columns; gap |
| Copycat | Allowed overlap + reason, or two other axes that differ |
| Done | Paste checklist; CSS diff vs freeze; screenshots 375 / 1440 |

## Do not fight last-approved pixels with a new theory

If round-1 tokens were accepted as identity, **commit them**. A later craft pass amends L, grain, and chrome per `DESIGN.md` — not a new hue family, unless the user asked to amend the freeze.
