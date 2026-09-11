# UI standards (all products)

Industry constraints for any surface. Project `DESIGN.md` may tighten these; it may not weaken WCAG.

## Token layers (W3C DTCG)

Use three layers. Aliases use `{path.to.token}`.

1. **Primitive** — palette, type families, raw spacing steps.
2. **Semantic** — `color.action`, `color.surface`, `color.danger`, `space.section`.
3. **Component** — `button.bg.primary`, `card.padding`.

Compile into CSS variables or Tailwind `@theme`. Agents consume semantic/component names, not primitive hex.

Spacing scale is **4px / 8px**. Do not invent `13px` or `17px`.

## Lightness spread (marketing / storefront)

Hue and chroma can be in spec while the page still reads as **flat pastel monotone** (every surface in a ~0.05 L band). That is a ship-blocker.

- **Non-ink surfaces** (`--background`, `--card`, `--muted`, `--secondary`, `--accent`): the lightest L minus the darkest L must be **≥ 0.15** (prefer **≥ 0.20**).
- **Dark-anchor:** `--foreground` (or a named ink token) must be used as a **background** on at least one full-width band per marketing/storefront page — not only as text color.
- If `muted` and `background` (or `card`) are within **0.03 L**, collapse them or darken `muted`. Do not keep twin tokens that look identical.
- `DESIGN.md` must list these L numbers, not “add contrast.”

Admin/data chrome may stay tight. Customer-facing homepages may not.

Hue family is **not** a global constraint. L-spread and dark-anchor are. See [color.md](color.md).

## Surfaces and density

| Surface | Examples | Density |
|---|---|---|
| `marketing` | Landing, hero, campaign | Comfortable (`gap-8`, large type) |
| `app` | Settings, account, app chrome | Default |
| `data` | Tables, admin, reports, IDE-like | Compact |
| `form` | Auth, checkout, wizards | Default; one primary CTA |
| `media` | Galleries, product galleries, avatars | Reserved aspect box |

Do not apply marketing padding to data tables. Do not apply compact admin density to a marketing hero.

## WCAG 2.2 AA (required)

- Text contrast ≥ **4.5:1** (large text ≥ 3:1). After a palette seed, check type tokens on every fill they sit on — see [color.md](color.md) pairing table. Do not keep a sibling’s `--foreground` when the page hue changed.
- Pointer targets ≥ **24×24 CSS px** (prefer 44px on touch storefronts).
- Visible focus. Never `outline: none` without a replacement ring.
- Honor `prefers-reduced-motion: reduce`.
- Do not convey meaning by color alone.

## Motion

- Budget: **2–3** intentional motions per view, named in `DESIGN.md` if they exist.
- Transition only the properties that change (`color`, `opacity`, `transform`). Never `transition-all`.
- **Forbidden defaults:** `hover:scale-[1.02]`, `hover:scale-105`, hover-lift + shadow on every card, parallax, scroll-jacking.

## States (every new screen)

Empty, loading, error, disabled, and no-permission. Empty states: one short message + one CTA. No fake ratings, placeholder testimonials, or hollow metric cards.

## Anti-patterns (global)

- Inter / Roboto / system UI as a *display* face unless the project `DESIGN.md` names them.
- **Cream editorial kit** = banned serif + postcard split + boxed CTA + no grain — not “any warm plaster.” Any hue family is legal unless it is a slop **kit** or a freeze violation. Full list: [slop.md](slop.md). Literal token freezes in `DESIGN.md` are not optional. Palettes may overlap siblings ([color.md](color.md)).
- Purple-on-white SaaS gradient; D2C `rounded-xl` + slate borders + trust-badge row.
- Hardcoded hex next to a token system.
- A second button/input/modal while one exists in the kit.
- Brand archetypes in standing rules (“make it like Apple / Shopify / Linear”). Those belong in a one-off prompt, not `DESIGN.md`.
- `transition-all duration-300 hover:scale-*` as “premium micro-interaction.”
- Marketing/storefront with no depth, or **flat pastel monotone** (all surfaces within ~0.06 L, ink never used as a fill).
