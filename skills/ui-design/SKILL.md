---
name: ui-design
description: >-
  Applies a product-agnostic UI design system: DESIGN.md lookup, DTCG tokens,
  surface density, WCAG 2.2 AA, component reuse, AI-slop gates, and browser
  verification. Use when creating or editing UI, layouts, CSS, Tailwind,
  components, theming, DESIGN.md, or when the user asks for UI design, visual
  polish, frontend styling, or to avoid generic AI-looking UI.
---

# UI Design

Cursor is code-first. Quality comes from a written visual contract, real primitives, and a see-then-refine loop — not from vibe words or prompt packs.

Do not install or invoke TypeUI, UIUX Pro Max, or similar style catalogs. They fight a product spec.

This skill does **not** promise one-shot perfect UI. A stronger first pass still needs screenshots and a checklist.

## Spec lookup (project wins)

Read in this order. Later files do not override earlier ones.

1. **Project `DESIGN.md`** at repo root (required if it exists).
2. **Project tokens** (`tokens/*.tokens.json` or the path `DESIGN.md` names).
3. **Project UI primitives** (e.g. `src/components/ui`, `app/components/ui`).
4. If there is no project `DESIGN.md`, read [DESIGN.md](DESIGN.md) in this skill.

Also read [standards.md](standards.md), [color.md](color.md), and, for prompting hygiene, [operator.md](operator.md). For **marketing, landing, or storefront** surfaces, read [slop.md](slop.md) **before** calling the work done.

New repos: copy this skill's [DESIGN.md](DESIGN.md) and [tokens.tokens.json](tokens.tokens.json) into the project, copy [repo-rule.mdc](repo-rule.mdc) to `.cursor/rules/ui-design.mdc`, then replace placeholder values.

## Before writing UI

1. Name the **surface**: `marketing` | `app` | `data` | `form` | `media`. Density follows the surface (see [standards.md](standards.md)).
2. Reuse existing primitives. Do not invent a second button, input, dialog, or icon set.
3. Use semantic tokens / CSS variables only. No raw hex in components. No default Tailwind palette as brand (`blue-500`, `slate-*`, `zinc-*` as identity).
4. **Color:** if `DESIGN.md` has no freeze, follow [color.md](color.md) — ask for two shades or a gradient (optional third = ink), or reuse a sibling theme with a reason. Derive type color; paste the pairing table. Any family is legal except slop kits. Do not invent a hue veto against an existing theme.
5. Specify empty, loading, error, disabled, and permission-denied for every new screen.
6. Lock media in a reserved box (`aspect-*` + `object-cover` or a skeleton). Do not invent a global aspect ratio.

## After writing UI

If the change is user-visible (layout, styling, routing, client state, rendered data):

1. Open the real page in the browser.
2. Exercise the flow (click, type, submit, navigate). A single screenshot is not verification.
3. Check **375 / 768 / 1440**.
4. Fix what you see, then re-check.

Browser tools, Playwright, or Figma MCP are optional helpers. The running app is enough.

### Slop gate (marketing / landing / storefront)

A structure pass that looks like a template is **not done**. Before you stop:

1. Screenshot the first viewport, primary content, CTA, and footer at 1440 and 375.
2. If `DESIGN.md` has an **Approved token freeze**, diff CSS token lines against it. Do not change hue family to “fix slop.” Sibling overlap is allowed when [color.md](color.md) says so; a full identity clone without a written reason is not.
3. Paste the [slop.md](slop.md) checklist in the reply (L-spread ≥ 0.15, dark-anchor band, card chrome, copycat, slop kits, type pairing).
4. Depth and rhythm: ink as a fill once per marketing page; not `box-shadow` as depth.

Do not run a marketing craft pass on admin or data chrome unless the user asked for a brand pass.

## Prompt gaps

If `DESIGN.md` is silent on a decision, do not invent a parallel system. Use the closest existing component, then list the spec gap in the reply so the user can update `DESIGN.md`. If it is silent on **color**, ask for a seed ([color.md](color.md)) instead of defaulting to cream/clay, indigo SaaS, or the host app’s admin primary.
