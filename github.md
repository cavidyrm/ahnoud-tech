repo: cavidyrm/ahnoud-tech
branch: main

secondary_repo: cavidyrm/ahnoud-cars
secondary_branch: main

## Last sync
date: 2026-07-31T17:20:00Z

### Updated in this project
- Favicon and app-icon set rebuilt from `assets/ahnoud-logo-tile.png` in cavidyrm/ahnoud-cars.
- Deploy-ready static build in the repo's own layout (Caddyfile + Dockerfile serving `index.html`).
- Expanded SEO metadata, web app manifest, and JSON-LD `@graph`.
- Touch support: vertical swipe preserved on every section, tap states replace hover, horizontal flicks on the stats and stage rows.

## Local changes since last sync (v1.0.0, 2026-11-01)
- Draft Labs removed; Kinomad Studio covers all six services.
- New contact details (hello@ahnoud.com, phone, WhatsApp, Telegram) and Building 14 address.
- SEO/AEO/GEO pass, self-hosted images, founder photo, motion refinements.
- Uploads cleaned; VERSION and CHANGELOG.md added.

## Screen map
| Project screen | Repo files |
|---|---|
| Landing page (hero, about, studio, services, approach, FAQ, CTA, footer) | `Ahnoud Tech Landing.dc.html`, `support.js`, `image-slot.js`, `images/*` |
| 404 page | `404.html` |
| Deploy config | `Dockerfile`, `Caddyfile`, `docker-compose.yml`, `.github/workflows/deploy.yml`, `.dockerignore` |
| SEO / icons | `robots.txt`, `sitemap.xml`, `site.webmanifest`, `llms.txt`, `llms-full.txt`, `seo-static.html`, `images/favicon-*.png`, `images/apple-touch-icon.png`, `images/icon-*.png`, `images/og-card.png` |

Icon source: `assets/ahnoud-logo-tile.png` from cavidyrm/ahnoud-cars@main, cropped to the tile and resized.
