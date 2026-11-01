# CLAUDE.md — Ahnoud Tech landing page (v1.0.0)

You are working on the marketing site for **Ahnoud Tech**, a design and engineering studio in Dubai. This repository is the complete handoff: the working site, its deploy setup, SEO files, assets, and a full design spec.

## Read first
1. `HANDOFF.md` — the design spec: every section, exact copy, measurements, colours, type, motion, states, and SEO requirements. Treat it as the source of truth for look and behaviour.
2. `README.md` — file layout, deploy pipeline, release steps.
3. `CHANGELOG.md` / `VERSION` — current version and history.

## What the site is today
- `Ahnoud Tech Landing.dc.html` is a **Design Component**: one HTML file (head + SEO, inline-styled template, logic class) rendered in the browser by `support.js`. No build step.
- It is production-ready as-is: `Dockerfile` renames it to `index.html`, injects `seo-static.html` as a `<noscript>` fallback, and serves everything with Caddy. Pushing to `main` deploys via `.github/workflows/deploy.yml` (GHCR + SSH + docker compose).

## Likely tasks
**A. Maintain the current site** (copy edits, small fixes, new images)
- Edit `Ahnoud Tech Landing.dc.html` directly. Styles are inline; responsive and state overrides live in the `<style>` block in `<helmet>` keyed by `data-r` / `data-bp` attributes.
- Never edit `support.js` (vendored runtime).
- Images: put new files in `images/` with a **new file name** (they are cached for a year), provide mobile/tablet/desktop WebP sizes, set `alt` on the `image-slot`, and update `sitemap.xml`.

**B. Rebuild in a framework** (if asked)
- Recreate the design from `HANDOFF.md` in the target stack. If none is specified, use **Astro** (or Next.js static export): the page is content-heavy and must be **prerendered** so crawlers see the copy without JavaScript.
- Match the design pixel for pixel at all three breakpoints (mobile ≤700, tablet ≤1024, desktop). Keep every animation, the reduced-motion behaviour, and the touch behaviour described in `HANDOFF.md`.
- Port the full `<head>` (meta, Open Graph, preloads, JSON-LD) unchanged. Once the page is prerendered, drop `seo-static.html` and its Dockerfile step.
- Keep the Caddy/Docker/CI deploy unless told otherwise; only the build output changes.

## Rules
- **Keep copy in sync across five places** whenever text changes: the page, the JSON-LD block in its `<head>`, `seo-static.html`, `llms.txt`, `llms-full.txt`. FAQ answers must match the FAQPage schema word for word.
- Facts (do not alter without being asked): email `hello@ahnoud.com`; phone `+971 50 483 9038` (WhatsApp `https://wa.me/971504839038`, Telegram `https://t.me/+971504839038`); address `Building 14, 18 Street - Zaa'beel Second - Za'abeel - Dubai - UAE`; founded 2024; founder Hannan Amiri; languages English and Arabic; parent site `https://ahnoud.com`; team site `https://kinomadstudio.com`; domain `https://ahnoudtech.com`.
- Don't add sections, copy, or stats that aren't in `HANDOFF.md` without asking.
- Accessibility: keep the skip link, focus rings (`#70b3f7`), modal focus trap, `aria-expanded`/`aria-current`, alt text, and 44px touch targets.
- Release: bump `VERSION` and `<meta name="version">` in the page, add a `CHANGELOG.md` entry, update `<lastmod>` in `sitemap.xml` and `dateModified` in the JSON-LD, then tag `vX.Y.Z`.

## Commands
```bash
npx serve .                                   # preview; open "Ahnoud Tech Landing.dc.html"
docker build -t ghcr.io/cavidyrm/ahnoud-tech:1.0.0 .
docker run --rm -p 8080:80 ghcr.io/cavidyrm/ahnoud-tech:1.0.0   # smoke test at :8080
```

## Done means
- Page loads with no console errors at 390px, 820px and 1440px widths.
- Lighthouse SEO and Accessibility ≥ 95; the hero image is the LCP element and is preloaded.
- JSON-LD passes the Schema.org validator; FAQ copy matches the visible FAQ.
- `/404-test` returns the branded 404 with status 404.

## Open items (from the client)
1. Set the `formEndpoint` prop (e.g. Formspree) so enquiries post directly; without it the form opens a `mailto:`.
2. Replace the Unsplash hero/studio/CTA photos with studio work when supplied.
3. Arabic page: not built yet. When it is, add `hreflang="ar"` and `og:locale:alternate`.
4. Confirm Telegram works by phone number, or switch to a username link.
