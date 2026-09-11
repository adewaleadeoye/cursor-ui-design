---
product: REPLACE_ME
densityDefault: app
colors:
  background: "{semantic.color.surface}"
  foreground: "{semantic.color.ink}"
  surface: "#FAFAF9"
  ink: "#1C1917"
  muted: "#57534E"
  action: "#1D4ED8"
  actionHover: "#1E40AF"
  danger: "#B91C1C"
  border: "#E7E5E4"
typography:
  body:
    fontFamily: ui-sans-serif, system-ui, sans-serif
    fontSize: 16px
    fontWeight: 400
    lineHeight: 1.5
  heading:
    fontFamily: ui-sans-serif, system-ui, sans-serif
    fontSize: 24px
    fontWeight: 600
    lineHeight: 1.25
spacing:
  scale: [4px, 8px, 16px, 24px, 32px, 48px, 64px]
radius:
  md: 8px
kit:
  primitives: src/components/ui
---

# Visual contract

This file is the **project** `DESIGN.md`. Replace every placeholder. Do not treat the starter blues/neutrals as a brand.

## Personality

Product UI: focused, readable, token-driven. Not marketing-soft, not template-SaaS.

## Surfaces

Name each screen `marketing` | `app` | `data` | `form` | `media`. Density follows the ui-design skill `standards.md`.

## Color

Use semantic names only: `background`, `foreground`, `primary`, `muted`, `destructive`, `border`, `ring`. Map them to CSS variables. Never paste hex into components.

If this file has no freeze yet, take two shades or a gradient from the user and expand them per the ui-design skill `color.md`. Any family except slop kits. Do not default to these fallback blues.

### Approved token freeze

Replace this block after a seed. Until then it is a placeholder, not a brand.

```css
--background: oklch(0.985 0.002 90);
--foreground: oklch(0.22 0.01 70);
--card: oklch(0.995 0.001 90);
--card-foreground: oklch(0.22 0.01 70);
--primary: oklch(0.45 0.12 260);
--primary-foreground: oklch(0.99 0.01 90);
--secondary: oklch(0.80 0.02 90);
--secondary-foreground: oklch(0.22 0.01 70);
--muted: oklch(0.80 0.02 90);
--muted-foreground: oklch(0.42 0.02 70);
--accent: oklch(0.90 0.015 90);
--accent-foreground: oklch(0.22 0.01 70);
--border: oklch(0.85 0.015 90);
--input: oklch(0.85 0.015 90);
--ring: oklch(0.45 0.12 260);
--radius: 0.5rem;
```

Non-ink L-spread must stay ≥ 0.15. One full-width marketing band uses `--foreground` as background.

## Type

One body face, optional display face named in this file. Hierarchy: display → heading → body → caption/meta. Metadata is smaller and muted; titles are not.

## Spacing and radius

4px grid. Default control radius `8px` unless this file says otherwise. Marketing surfaces may use larger section padding; data surfaces may not.

## Components

Prefer the project's existing kit. If none exists yet, keep primitives boring: solid fills, 1px borders, no shadows as identity, no gradients.

Buttons: default / secondary / outline / ghost / destructive. Every interactive control has hover **and** focus. Focus is a visible ring.

## Page layout

- Marketing: one dominant hero, content on a shared max-width rail.
- App: header or sidebar + main; settings are stacked sections, not a landing page.
- Data: dense tables, sticky header, filters above the grid.

## Do not

- Invent a palette because the prompt said “premium.”
- Use hover-scale or `transition-all`.
- Mix two brand archetypes in one screen.
- Use `--primary` as heading or body color.
