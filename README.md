# Ahnoud Tech, Landing Page · v1.0.0

Single-page marketing site for **Ahnoud Tech**, a design and engineering studio in Dubai. One in-house team, **Kinomad Studio**, covers brand identity, web design, 3D, web development, AI agents, and DevOps.

The page is a **Design Component** (`.dc.html`): one HTML file with an inline template and a logic class, rendered by `support.js`. No build step, no dependencies.

- Version: see `VERSION`; history in `CHANGELOG.md`
- Live domain: `https://ahnoudtech.com`
- Working with Claude Code: start with `CLAUDE.md`, then `HANDOFF.md`
- Contact on the site: hello@ahnoud.com · +971 50 483 9038 (WhatsApp, Telegram)

---

## Quick start

```bash
npx serve .        # any static server
# open "Ahnoud Tech Landing.dc.html"
```

Use a local server rather than `file://` so fonts and images load.

---

## File structure

```
.
├── Ahnoud Tech Landing.dc.html   # the page (becomes index.html in the image)
├── 404.html                      # brand-matched not-found page (noindex)
├── support.js                    # Design Component runtime (vendored, do not edit)
├── image-slot.js                 # image component (supports alt + priority attributes)
├── seo-static.html               # <noscript> copy of the page, injected at build
├── robots.txt / sitemap.xml      # crawler rules, image sitemap
├── llms.txt / llms-full.txt      # plain-text summary for AI answer engines
├── site.webmanifest              # PWA manifest
├── Caddyfile                     # static server: compression, caching, headers, 404
├── Dockerfile                    # caddy:alpine image
├── docker-compose.yml            # Traefik-routed service
├── .github/workflows/deploy.yml  # build, push to GHCR, redeploy over SSH
├── CLAUDE.md                     # instructions for Claude Code (start here)
├── HANDOFF.md                    # full design spec: sections, copy, tokens, motion
├── VERSION / CHANGELOG.md
├── images/
│   ├── logo.svg
│   ├── hero-brand-identity-{mobile,tablet,desktop}.webp
│   ├── hero-web-design-{…}.webp
│   ├── hero-engineering-{…}.webp
│   ├── kinomad-studio-{…}.webp
│   ├── cta-studio-{…}.webp
│   ├── hannan-amiri.webp / .jpg  # founder avatar (webp on page, jpg for schema)
│   ├── favicon-16/32.png, apple-touch-icon.png, icon-192/512.png
│   └── og-card.png               # 1200×630 share image
├── assets/                       # source files only (not shipped)
│   ├── ahnoud-logo-tile.png      # icon master
│   ├── logo-source.svg           # logo master
│   └── hannan-amiri-original.jpg # founder photo master
```

`.dockerignore` keeps `assets/`, all `*.md` docs, and CI/compose files out of the image.

---

## Deploy

```bash
docker build -t ghcr.io/cavidyrm/ahnoud-tech:1.0.0 -t ghcr.io/cavidyrm/ahnoud-tech:latest .
docker run --rm -p 8080:80 ghcr.io/cavidyrm/ahnoud-tech:latest   # smoke test on :8080
```

Pushing to `main` runs `.github/workflows/deploy.yml`: build, push to GHCR, SSH to the server, `docker compose pull && docker compose up -d` in `APP_DIR`. Secrets: `SERVER_HOST`, `SERVER_USER`, `SERVER_SSH_KEY`, `GHCR_TOKEN`, `APP_DIR`.

The Dockerfile renames the page to `index.html`, injects `seo-static.html` after `<body>`, and installs the Caddyfile. Caddy caches `images/*` for a year (rename files when they change), revalidates scripts and the manifest daily, revalidates HTML on every request, and serves `404.html` for missing paths. Traefik terminates TLS.

**Release a new version:** bump `VERSION`, the `<meta name="version">` in the page, and add a `CHANGELOG.md` entry; tag the commit `vX.Y.Z`.

---

## Sections

| # | Section | Notes |
|---|---|---|
| 1 | Hero | Three sticky frames (Identity → Design → Engineering) with parallax. Contains the page `h1`. |
| 2 | About Us | Caption, word-by-word scroll reveal, purpose line, founder. |
| 3 | Studio | Kinomad Studio, six disciplines, image wipe-in; links to kinomadstudio.com. |
| 4 | Services | Six rows with one-line descriptions and an invert-on-hover fill. Background fades light → dark here. |
| 5 | Studio Approach | Statement, stat carousel, four-stage accordion. |
| 6 | FAQ | Six questions; mirrored in FAQPage schema. |
| 7 | CTA | Pinned call to action, opens the Start a project modal. |
| 8 | Footer | Nav, email/phone/WhatsApp/Telegram, address, Visit Ahnoud.com, Dubai clock, interactive halftone strip. |

---

## Tweaks (editor props)

- **Device** — Fit screen (shipped page) / Desktop / Tablet / Mobile preview.
- **Accent · Ink** (default `#be5d09`) and **Accent · Draft** (default `#2d8ff0`).
- **Contact email** — default `hello@ahnoud.com`.
- **Form endpoint** — POST URL for enquiries (e.g. Formspree). Empty = opens the visitor's email app.
- **Save as default** — stores tweak values in `localStorage` (editor convenience).

---

## SEO / AEO / GEO

- **SEO:** title, ≤160-char description, canonical, hreflang (en, x-default), geo meta, Open Graph/Twitter, favicons, manifest, preloaded hero image, semantic headings, alt text on every image, image sitemap.
- **AEO:** JSON-LD `@graph` with Organization (founder with photo, address, phone, languages en/ar, Kinomad Studio sub-organization), ProfessionalService with six Services, WebSite, WebPage, FAQPage. Every fact is visible on the page.
- **GEO:** `llms.txt`, `llms-full.txt`, and the `<noscript>` copy; `robots.txt` allows the major search and AI crawlers.

**Keep in sync when editing copy:** the page, `seo-static.html`, `llms.txt`, `llms-full.txt`, and the JSON-LD block.

**Still to do**
1. Set `formEndpoint` so enquiries arrive without the email app.
2. Replace the stock hero/studio/CTA photos with your own work (keep the file names or update them in the page and sitemap).
3. Submit the sitemap in Google Search Console and Bing; claim a Google Business Profile at the Za'abeel address.
4. Add an Arabic page later, then add `hreflang="ar"`.
5. Confirm the Telegram number is discoverable by phone number, or switch to a username link.

---

## Image credits

Hero, studio, and CTA photos are from [Unsplash](https://unsplash.com) (free licence), re-encoded as WebP and self-hosted. Founder photo supplied by Ahnoud Tech.

---

© 2024–2026 Ahnoud Tech.
