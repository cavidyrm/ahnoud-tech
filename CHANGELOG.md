# Changelog

All notable changes to the Ahnoud Tech landing page. Versions follow [SemVer](https://semver.org/).

## [1.0.0] - 2026-11-01

First production release.

### Site
- Single-page site: hero (three sticky frames), About Us, Kinomad Studio, Services, Studio Approach, FAQ, CTA, footer.
- Kinomad Studio is the only in-house team and covers all six services.
- "Start a project" modal: name, email, company, project brief; posts to `formEndpoint` when set, otherwise opens a pre-filled email.
- Contact: hello@ahnoud.com, +971 50 483 9038, WhatsApp and Telegram links.
- Address: Building 14, 18 Street - Zaa'beel Second - Za'abeel - Dubai - UAE.
- Founder photo (Hannan Amiri) and self-hosted WebP images sized per breakpoint.

### SEO / AEO / GEO
- Title, description, canonical, Open Graph and Twitter cards, geo meta, favicon set, manifest.
- JSON-LD graph: Organization, ProfessionalService with six Services, WebSite, WebPage, FAQPage.
- `llms.txt`, `llms-full.txt`, and a `<noscript>` copy of the page (`seo-static.html`) for crawlers that skip JavaScript.
- Image sitemap.

### Motion
- Scroll-driven hero parallax, word-by-word About reveal, light-to-dark fade into Services.
- Stat carousel with timer bar; pauses on hover, focus, touch, off-screen, and background tabs.
- Modal and menu open/close animations; FAQ height animation.
- Footer halftone strip follows the cursor, or the finger on swipe (taps are ignored).
- `prefers-reduced-motion` respected throughout.

### Housekeeping
- Removed working uploads; logo and founder photo originals kept in `assets/`.
- Scripts and manifest now revalidate daily instead of being cached for a year.
- Single Claude Code handoff: `CLAUDE.md` (instructions) and `HANDOFF.md` (design spec) at the repo root.
