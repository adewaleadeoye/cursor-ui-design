# Color (open palettes)

Hue families are not exclusive. Any palette is legal except **AI slop kits** ([slop.md](slop.md)). Guidelines (L-spread, dark-anchor, WCAG, chrome) shape how a seed becomes tokens. They do not pick the family.

## Seeds (preferred)

If `DESIGN.md` already has an **Approved token freeze**, honor those strings. Do not invent a second family just to look different from a sibling theme.

If there is no freeze, get a seed before writing CSS:

1. **Two shades** (hex, rgb, oklch, named CSS, or sampled from a screenshot), or
2. **A CSS gradient** (use the **first and last** stops only — a gradient is input, not UI), or
3. **Reuse a sibling** with one sentence of reason (e.g. “same warm clay — both domestic goods”).

Optional **ink** (third shade): body/heading color only — not a third fill. See Type color.

Ask **once** if none of those exist:

> No freeze yet. Send two shades or a CSS gradient (hex, oklch, or a screenshot). Optional third shade = ink (body text). I will expand them to a token freeze (L-spread, dark-anchor, type contrast). Overlap with an existing theme is fine if it fits — say so in one sentence. Or say “you pick” and I will propose one non-slop freeze for approval.

If the user says **you pick**: propose one freeze, show the `oklch` block **and** the pairing table, wait. Do not default to cream + terracotta, indigo SaaS, or the host app’s admin primary.

## Expand a seed to a freeze

Convert seeds to oklch. Do **not** add a third **fill** hue “for richness.” A third seed, if present, is **ink**. Do **not** keep `linear-gradient` as brand identity (that is a slop kit). Do **not** “correct” an unusual seed into plaster/clay.

1. Sort by L: light vs dark.
2. Higher chroma (ΔC ≳ 0.08) → `--primary` / `--ring`. Lower-chroma light → surfaces.
3. `--background`: light seed, L about **0.93–0.98**.
4. `--card`: slightly lighter/cleaner than background (L up to **0.995**), lower C.
5. `--muted` / `--secondary`: **same hue family**, L ≤ card L − **0.15** (collapse twins).
6. **Type color** — see below. Do not leave `--foreground` / `--muted-foreground` as leftovers from a sibling freeze.
7. `--primary`: action seed. If contrast vs card fails WCAG, change **L or C**, not hue family.
8. `--radius` and typeface come from the presentation spec, not from the seed.

Paste the freeze into `DESIGN.md` on the spec pass. CSS comes after approval. In the spec reply, paste the **type pairing table** (below). Any fail: move **ink L/C** first. Do not retint the operator’s page or action seeds to fix text.

## Type color (ink)

Page and action seeds are **fills**. Body text is a separate token set. High-chroma straw, leaf, or tomato as *fills* does not mean high-chroma text.

**Operator (optional third seed).** Two shades are enough. A third shade, if given, is ink — body/heading color, not a third fill.

- `Ink: #1C1917` or `oklch(...)` — use that hue; set L so pairings pass.
- `Ink: near-black` — L ~0.20–0.24, C ≤ 0.03, hue from the page seed (not a cold `#111` unless they said neutral).
- `Ink: match action` — same hue as `--primary`, C ≤ 0.06, L ~0.22–0.28 (readable ink, not a saturated paragraph).
- Omitted — derive: same hue as the **page** seed, L **0.22–0.28**, C **0.02–0.06**. Dark seed with L ≤ 0.35 becomes ink as-is (then check pairings).

**Map tokens (do not skip):**

| Token | Role | Derive |
|---|---|---|
| `--foreground` | Headings, body, links that are not the button | Ink. Also the **dark-anchor fill**. |
| `--card-foreground` | Title/price on `--card` | Same as `--foreground` unless card is a different plane that needs its own L. |
| `--secondary-foreground` / `--accent-foreground` | Text on those fills | Same as `--foreground` when those fills are light. |
| `--muted-foreground` | Captions, helper, metadata | Same hue, L **0.38–0.48**, C ≤ ink C. Must still hit **4.5:1** on `--muted` (hardest pair). |
| `--primary-foreground` | Label **on** the primary button | Light paper if primary is dark (L ≳ 0.95, C from page); dark ink if primary is light. Not a third hue. |
| Dark-anchor type | Text **on** a full-width ink band | `color: var(--background)` or `--card`. If that fails 4.5:1, lighten the type token — do not abandon the dark fill. |
| Hero on photo | Heading/body on media | Copy-side **scrim** (page or ink at enough opacity). Bare `--foreground` on a photograph is a fail if contrast is unknown. |

Do **not** use `--primary` as heading or body color. Action stays on buttons/links that are explicitly CTAs.

If the page seed is dark (L ≤ 0.45), invert: `--foreground` becomes light (L ≳ 0.92), muted-foreground a step down, dark-anchor may already be the page.

### Pairing table (paste in the spec reply)

Contrast **WCAG 2.2 AA**: body/caption **4.5:1**, large display (≥18px bold or ≥24px) **3:1**. Check these pairs against the freeze (relative luminance, not vibes):

| Text | On fill | Fail if |
|---|---|---|
| `--foreground` | `--background` | < 4.5:1 |
| `--foreground` | `--card` | < 4.5:1 |
| `--foreground` | `--muted` | < 4.5:1 |
| `--muted-foreground` | `--background` | < 4.5:1 |
| `--muted-foreground` | `--card` | < 4.5:1 |
| `--muted-foreground` | `--muted` | < 4.5:1 |
| `--primary-foreground` | `--primary` | < 4.5:1 |
| `--background` or `--card` (type) | `--foreground` (CTA fill) | < 4.5:1 |
| `--primary` as **link** text | `--background` / `--card` | < 4.5:1 (if links use primary) |

Fix order: `--muted-foreground` L → `--foreground` L/C → `--primary-foreground` L. Last resort: slight L on `--muted` fill. **Never** rotate the operator’s page/action hues to make type work.

Do not paste the host app’s default `--primary` as a silent brand. If the user seeded that color, use it.

## Overlap vs copycat

**Overlap is allowed** when the category or a user seed matches a sibling. Record the reason in `DESIGN.md`.

**Copycat (fail)** — all of:

- Token-near-clone of a sibling: `--primary` ΔH ≤ 8° and ΔL ≤ 0.04 and ΔC ≤ 0.04 **and** `--background` ΔH ≤ 20° and ΔC ≤ 0.02 and ΔL ≤ 0.03
- Same display face
- Same card chrome rules
- `DESIGN.md` has **no** overlap reason

**Not a copycat** if the user seeded those colors, or `DESIGN.md` states the shared family **and** at least two other axes differ (density, hero, sections, radius, typeface, or page chroma ΔC ≥ 0.03).

Do not force a new hue family just to avoid looking related.

## Still required (not hue vetoes)

- Non-ink L-spread ≥ **0.15**; one dark-anchor band on marketing/storefront
- WCAG 2.2 AA on text — pairing table in the spec reply; fix ink L/C, not seeded fills
- No slop **kits** (cream editorial combo, purple SaaS gradient, overlay product tiles, hover-scale)
- Honor an approved freeze until the user asks to amend it
- Do not retint a freeze to “fix slop”
