# AI slop (ship-blocker)

Read this before shipping **marketing**, **landing**, or **storefront** UI. Admin/data chrome is exempt unless the user asked for a brand pass.

A page can be on-token, accessible, and still be slop. If a screenshot matches a **kit** below, it is not done.

Color families are **open**. Green, warm clay, cool gray, high chroma — none of those is a fail by itself. See [color.md](color.md). Fail **kits** (combinations) and **copycat** (whole identity stolen without a reason). Do not fail a theme for sharing a sibling’s warmth when the category matches.

If `DESIGN.md` contains an **approved token freeze** (literal `oklch(...)` lines), those strings win. Do **not** rotate hue families to “fix” slop. Fix layout, type pairing, grain, and bleed instead.

## Depth (required)

Depth is not `shadow-lg`. For the first viewport of marketing/storefront, at least **two** must be true:

1. **Media owns an edge** — photograph/video bleeds to a viewport edge, or overlaps the type column. A rounded image in a 50/50 grid is not depth.
2. **Two real planes** — background vs surface differ enough to read at a glance.
3. **Material at 100% zoom** — grain, fiber, or a 1px thread-line. Opacity ≳ 5% if grain is used; weaker grain = omit it.
4. **Type on media** — heading on the crop (copy-side scrim) — not a caption beside a postcard.

## Kit: cream editorial (combination fail)

The **kit** is the combination, not warm hue alone. Warm plaster is valid when the freeze or a user seed sets it. Fail when **three or more** are true:

- Flat fill, no grain ≥5%, `html` still `oklch(1 0 0)`
- Display face from the banned premium-serif list
- Split hero: type | rounded postcard photo, caption-sized offer
- Centered rounded CTA card
- Generic 3-column footer, no presentation treatment

### Banned “premium serif” defaults (with warm plaster)

Playfair Display, Fraunces, Source Serif 4, Cormorant Garamond, Libre Baskerville, EB Garamond, DM Serif Display, Italiana, Bodoni Moda.

A face **named in the freeze** on warm plaster is allowed.

## Kit: silent host-primary default

**Not a fail:** a presentation that uses a color because the user seeded it, the freeze names it, or the category matches.

**Fail:** the agent pasted the host app’s default `--primary` as the new identity **without** a seed or freeze.

## Kit: sibling copycat (whole identity)

**Not a fail:** two presentations in a related hue family when `DESIGN.md` records why, or the user seeded those colors, and other axes differ (grid density, hero, sections, type, chroma).

**Fail** when **all** are true vs a sibling:

- `--primary` ΔH ≤ 8° and ΔL ≤ 0.04 and ΔC ≤ 0.04
- `--background` ΔH ≤ 20° and ΔC ≤ 0.02 and ΔL ≤ 0.03
- Same display face and same card chrome rules
- No overlap reason in `DESIGN.md`

## Kit: flat pastel monotone (L-spread fail)

On-spec hue with no commitment: every large fill in **L 0.93–0.99**, ink only as text, sections as `div, div, div` of the same tint.

**Fail if** (marketing/storefront):

- Lightest non-ink surface L minus darkest non-ink surface L is **< 0.15**
- `--foreground` / ink is never a **background** on a full-width band
- `muted` vs `background` or `card` differ by **< 0.03 L** and both are used as section fills

**Pass:** one dark-anchor band (`background: var(--foreground)` or the freeze ink token) plus paper-white vs recessed muted with ΔL ≥ 0.15.

Do not “fix” this by shifting hue. Change **L** and **where ink is used**.

| Kit | Tells |
|---|---|
| Purple SaaS | Indigo/violet gradient, glass cards, Inter, glow |
| Broadsheet | Multi-column newspaper hero |
| D2C Shopify | `rounded-xl`, `border-slate-100`, gradient blobs, trust-badge row, **overlay heart/cart on product images** |
| Hover-lift | `transition-all`, `hover:scale-*`, shadow jump on every card |
| Hollow commerce | Empty featured heading, 0.0 stars, placeholder quotes |
| Marketplace tiles | Hard card border + pale fill + equal 3-up grid + overlay icons (even with good photos) |

## Token freeze and self-diff

When `DESIGN.md` has a fenced **Approved token freeze**:

1. Copy those lines into theme CSS / CSS variables exactly.
2. Before “done”, diff that block against the freeze. Any hue/L/C change is a regression unless the user asked to change tokens.
3. Re-check `--radius`, display font, spacing in the same diff.

Do not “improve” an approved freeze by shifting hue. Overlap with a sibling is not a reason to retint.

## Structure pass is not shippable

1. Structure (sections, primitives, states).
2. Screenshot 375 and 1440.
3. Itemized checklist in the **reply** (every anti-pattern line).
4. Token self-diff vs freeze.
5. Fail ⇒ fix in this session.

## Pre-ship checklist (paste into the reply)

| # | Check | Fail if |
|---|---|---|
| 1 | Token freeze | Any freeze `oklch` missing or moved without a user amend |
| 2 | Color seed | No freeze and no ask/seed; or silent host `--primary` paste |
| 3 | Copycat | Full identity clone of a sibling with no DESIGN.md reason |
| 4 | Cream editorial **kit** | Banned serif + postcard split + boxed CTA (warm plaster alone is not a fail) |
| 5 | Depth | Fewer than two depth tests |
| 6 | Hero | Brand not eyebrow when spec says so; photo not owning an edge |
| 7 | CTA | Centered bordered card |
| 8 | Product / card chrome | Border, shadow, or overlay icons on the image when spec forbids them |
| 9 | Supporting copy | Default `ul` bullets, no section treatment when spec asks for one |
| 10 | Footer | Untouched generic three-column stack |
| 11 | Rhythm | Every band same padding and same fill, no room breaks |
| 12 | Empty | Featured heading with zero items |
| 13 | Motion | `transition-all` or hover-scale |
| 14 | Purple / trust-badge kits | Gradients-as-identity, badge rows |
| 16 | L-spread | Non-ink surfaces span < 0.15 L |
| 17 | Dark-anchor | No full-width band uses ink/foreground as background |
| 18 | Twin surfaces | muted ≈ background ≈ card as section fills |
| 19 | Type color | Pairing table missing; or any required pair < 4.5:1; or leftover sibling `--foreground`; or `--primary` used as body/heading |
