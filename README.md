# Ahnoud Tech — Landing Page

A single-page marketing site for **Ahnoud Tech**, a design-and-engineering studio built around one idea: the brand and the build should never be separated. Two in-house teams — **Kinomad Studio** (design) and **Draft Labs** (engineering) — under one roof.

The page is built as a **Design Component** (`.dc.html`): a self-contained HTML file with an inline template and a logic class. It opens directly in a browser — no build step, no bundler, no dependencies to install.

---

## Quick start

Open `Ahnoud Tech Landing.dc.html` in any modern browser, or serve the folder with any static server:

```bash
# any static server works, e.g.
npx serve .
# then open the Landing file in the browser
```

A local server is recommended over `file://` so the fonts, logo, and stock images load without cross-origin restrictions.

---

## File structure

```
.
├── Ahnoud Tech Landing.dc.html   # the page (template + logic)
├── 404.html                      # brand-matched not-found page
├── support.js                    # Design Component runtime (do not edit)
├── image-slot.js                 # drag-and-drop image placeholder component
├── images/
│   └── logo.svg                  # Ahnoud Tech wordmark logo
├── uploads/                      # source materials & references (not shipped)
└── README.md
```

Only `Ahnoud Tech Landing.dc.html`, `404.html`, `support.js`, `image-slot.js`, and `images/logo.svg` are needed to run the site. The `uploads/` folder holds working references and can be excluded from any deploy.

---

## Sections

| # | Section | Notes |
|---|---------|-------|
| 1 | **Hero** | Three stacked, sticky frames (Branding → Design → Engineering) that scale up from below with layered image parallax. |
| 2 | **About Us** | Word-by-word reveal on scroll; a rotating stat carousel. Background shifts light → dark through this stretch. |
| 3 | **Teams** | Kinomad Studio and Draft Labs, each with disciplines and a parallaxing visual. Kinomad Studio links out. |
| 4 | **Services** | Six-row list with a left-to-right invert-on-hover fill. |
| 5 | **Studio Approach** | Four-stage accordion (Identity / Design / Build / Operate) styled as the hero's cream strip bars. |
| 6 | **CTA** | Pinned full-bleed call to action with a sliding last line. |
| 7 | **Footer** | Reveals beneath the page as you scroll; big nav, contact, and an interactive halftone strip that reacts to the cursor. |

---

## Tweaks (editor props)

The Design Component exposes a few editable props (shown as a Tweaks panel in the editor, or set via the `data-props` attribute):

- **Device preview** — Desktop / Tablet / Mobile responsive preview.
- **Accent · Ink** — Kinomad Studio accent color.
- **Accent · Draft** — Draft Labs accent color.
- **Contact email** — used across the nav, footer, and CTA `mailto:` links.
- **Save as default** — snapshots the current tweak values to `localStorage` so they persist as defaults on the next visit.

---

## Design notes

- **Type:** [General Sans](https://www.fontshare.com/fonts/general-sans) (via Fontshare) for display and body; a monospace stack for micro-labels.
- **Palette:** near-black `#0c0d10` and warm off-white `#e9e7e1`, with two configurable accents. The mid-page light stretch inverts foreground/background on a smoothstep ramp so text always keeps contrast.
- **Motion:** scroll-driven parallax and the halftone field are written directly to element styles inside a single scroll/RAF loop for smoothness; UI state (menu, accordion, stat carousel) is React-style state on the logic class.
- **Cursor:** a small delayed dot that inverts over light and dark areas (fine-pointer devices only).

---

## Images

The hero, team, founder, and CTA visuals are pulled from [Unsplash](https://unsplash.com) via URL as placeholders. To use your own art, drop images onto the slots in the editor (each `image-slot` persists its drop), or replace the `src` URLs in the template. The only bundled raster asset is `images/logo.svg`.

---

## Tech

- No framework install, no build. The `.dc.html` is rendered by `support.js` (the Design Component runtime) — treat it as vendored; don't edit it.
- `image-slot.js` provides the `<image-slot>` drag-and-drop placeholder used for every photo.
- `404.html` is a standalone page (plain HTML/CSS/JS) that mirrors the site's aesthetic and reuses the halftone effect.

---

© 2026 Ahnoud Tech. Design & Engineering.
