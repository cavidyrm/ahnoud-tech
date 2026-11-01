# HANDOFF.md — Ahnoud Tech Landing Page · v1.0.0 (design spec)

## Overview
Single-page marketing site for Ahnoud Tech, a design and engineering studio in Dubai (founded 2024, founder Hannan Amiri, part of Ahnoud). It presents the studio, its in-house team Kinomad Studio, six services, a four-stage approach, an FAQ, and a "Start a project" enquiry modal.

## About the Design Files
The files in this bundle are **design references created in HTML**: a working prototype showing the intended look and behaviour. `Ahnoud Tech Landing.dc.html` opens directly in a browser (serve the folder with any static server). The task is to **recreate this design in the target codebase's environment** (e.g. Next.js/React, Astro, Vue) using its patterns. If no codebase exists, a static-first framework such as Astro or Next.js (static export) is recommended, because the page is content-heavy and should be prerendered for SEO.

The prototype is also deployable as-is (see the repo README), so it can serve as the production site until the rebuild ships.

## Fidelity
**High-fidelity.** Colours, type, spacing, copy, and motion are final. Recreate pixel-perfectly.

## Breakpoints
Computed from the page width: **mobile ≤ 700px**, **tablet 701–1024px**, **desktop > 1024px**. Full-height sections use `100svh` (fallback `100vh`). Fluid type uses container query units (`cqw`) on the page scroller.

## Screens / Views

### 1. Global chrome
- **Intro overlay** (first visit per session only, skipped for reduced motion): full-screen `#0c0d10`, centred `logo.svg` at 64px height. Logo: clip/rise in 0.8s `cubic-bezier(0.22,1,0.36,1)`; overlay holds then fades over 1s total; removed at 1050ms.
- **Scroll progress bar**: fixed top, 2px tall, `scaleX(scroll/max)`, colour blends from Accent Ink to Accent Draft as the page darkens.
- **Top nav**: fixed, centred, `width: min(640px, 100% - 32px)`, top 18px (54px in the phone preview). Bar: 3-column grid (mail icon · centred logo 24px tall · menu button), padding 6px 18px, `rgba(12,13,16,0.6)` + `backdrop-filter: blur(18px) saturate(1.4)`, 1px border at 14% foreground, shadow `0 8px 32px rgba(0,0,0,0.18)`, radius 0. Icon buttons 36×36.
  - Hides on scroll down (>6px delta), returns on scroll up or near top; `translate` 0.45s enter easing.
  - **Menu**: drops below the bar (same glass), items ABOUT / STUDIO / SERVICES / APPROACH / CONTACT, 13px, weight 500, tracking 0.08em, centred, 12px padding. Open: panel `scaleY(0→1)` 0.32s, items `scaleX(0.4→1)` + fade 0.35s staggered 60ms. Close reverses (0.28s panel, items 0.22s staggered). Hover/focus: cream fill grows from the centre (0.65s in-out), text turns `#16171b`. Active section gets a 5px square marker. Closes on Escape, outside tap, any scroll >12px, wheel, or touch-move outside.
  - Burger: two lines that rotate ±45° into an X (0.4s in-out).
- **Cursor** (fine pointers only, hidden on touch): 10px cream square, `mix-blend-mode: difference`, lags the pointer (lerp 0.1), grows to 3.4× over interactive elements. **Magnetic buttons** (`data-magnetic`) move toward the cursor (x × 0.22, y × 0.32), press scales to 0.96.
- **Skip link** "Skip to content" appears on focus.

### 2. Hero (`header#top`), height = 3 × viewport (mobile frames are 0.8 × viewport)
Three sticky full-height frames stacked. Each frame: background image (grayscale; colour on hover, or when ≥45% in view on touch), dark gradient overlay, and a **cream bar** (`#e9e7e1`, text `#16171b`) inset 8% left/right, padding `clamp(14px,1.6cqw,22px) clamp(16px,2.2cqw,30px)`, shadow `0 18px 44px rgba(0,0,0,0.35)`.
- Bar left: mono label 10px, tracking 0.14em, 66% ink; title 600 `clamp(26px,3.4cqw,46px)`, tracking 0.02em. Bar right: index 13px 600; caption 15px 500 uppercase, tracking 0.06em, max-width 320px (mobile 170px / 12px).

| Frame | Bar top | Label | Title | Caption |
|---|---|---|---|---|
| 01 | 44% | BRAND IDENTITY | IDENTITY | The mark that stays long after the launch |
| 02 | 50% | WEB DESIGN • 3D | DESIGN | Interfaces people understand at a glance |
| 03 | 38% | DEVELOPMENT • AI • DEVOPS | ENGINEERING | The system that keeps it all alive |

- Frame 01 bottom-left (`h1`): mono eyebrow "DESIGN & ENGINEERING STUDIO • DUBAI" 11px, 82% cream (visually hidden prefix "Ahnoud Tech, "), then "The brand and the build, together." 600 `clamp(30px,4.6cqw,72px)`, line-height 1, tracking −0.02em, max 14ch. Bottom-right "SCROLL ↓" (arrow bobs 5px, 1.8s); fades out after 40px of scroll.
- Frame 01 bar and intro fade up 14px over 0.9s (delays 0.2s / 0.45s).
- **Scroll motion**: an incoming frame scales 0.9 → 1 as it rises; the covered frame drifts up 10% of frame height; images scale 1.2 and shift ±8%.

### 3. About Us (`#about-us`), light section
Background/foreground use `--fade-bg` / `--fade-fg` (start `#e9e7e1` / `#16171b`). Grid `300px 1fr`, gap 96px, padding 150px 40px (tablet 1 column, 100px 32px; mobile 80px 20px).
- Rail: "(ABOUT US)" 11px 500, tracking 0.12em, 62% fg.
- Caption (mono 12px, tracking 0.14em): "ONE STUDIO FOR THE BRAND AND THE BUILD".
- Two paragraphs, 500 `clamp(24px,2.4cqw,38px)`, line-height 1.42, max 920px. Each word starts at 16% fg and turns full fg as the block scrolls through (progress = `(0.85·vh − top) / (height + 0.3·vh)`):
  - "Ambitious teams deserve a brand as considered as the systems behind it. Most companies we meet have built something real, then split it across vendors who never talk to each other."
  - "That gap costs more than time. Design and engineering working side by side means what ships is one idea, carried end to end."
- Purpose row: grid `140px 1fr`, top border 12% fg, padding-top 28px. "(PURPOSE)" + "To give ambitious companies a brand and the systems behind it, designed and built as one, so what they launch looks right, works right, and keeps running." (`clamp(17px,1.3cqw,20px)`, line-height 1.6).
- Founder: 52px circular photo (grayscale → colour on hover), "Hannan Amiri" 14px 600, "Founder, Ahnoud Tech" 12px 62%.

### 4. Studio (`#teams` › `#team-kinomad`), light section
Two columns, min-height one viewport (mobile stacks; image 0.55 × viewport tall).
- Left column, padding 40px: label "THE STUDIO / DESIGN & ENGINEERING" 12px 500, tracking 0.14em, Accent Ink. `h2` "Kinomad Studio" 600 `clamp(44px,4.4cqw,76px)` (links to kinomadstudio.com, hover Accent Ink; rises in with a clip reveal). Body 17px, line-height 1.65, 60% fg, max 440px: "Kinomad Studio shapes how a company is seen and builds what runs underneath: identity systems, digital design, and dimensional storytelling, carried through production software, autonomous agents, and the infrastructure that keeps it all alive." Link "KINOMADSTUDIO.COM" 12px 600, underline at 45% accent.
- "(DISCIPLINES)" list: six rows, 15px vertical padding, 1px rules at 10% fg, name 17px 500 + index 11px: Brand Identity 01 · Web Design 02 · 3D Visualization & Animation 03 · Web Development 04 · AI Agents & Automation 05 · Application DevOps 06.
- Right: full-bleed image, wipes in top-to-bottom (1.2s in-out) when in view, parallax ±11% at scale 1.26.

### 5. Services (`#services`), `#0e0f13`
Padding 110px 40px 0. Header row: "(SERVICES)" left, `h2` "Brand, design, and engineering services." right (600 `clamp(30px,3.4cqw,52px)`).
Six rows (anchor to `#team-kinomad`), grid `70px 1fr`, padding 26px 8px, top rule 10% cream. Index "S/01"… 12px. Name (`h3`) 600 `clamp(20px,2.2cqw,30px)` and description 15px at 72% sit side by side in two equal columns (stacked on tablet/mobile).
- Brand Identity: Naming, strategy, logo and identity systems, and brand guidelines.
- Web Design: Websites and product interfaces, designed for clarity and conversion.
- 3D Visualization & Animation: Product renders, spatial visuals, and motion for launches and campaigns.
- Web Development: Fast, accessible websites and web apps, built to scale.
- AI Agents & Automation: Custom AI agents and automated workflows that take repetitive work off your team.
- Application DevOps: Deployment, cloud infrastructure, monitoring, and care after launch.

Hover/focus: cream fill sweeps in from the left (`background-size 0→100%`, 0.65s in-out), text turns `#16171b` (0.3s, 0.12s delay), padding-left 8 → 48px. On touch the fill shows on press.

**Light → dark fade**: `--fade-bg` goes `#e9e7e1 → rgb(14,15,19)` over scroll from `servicesTop − 0.95·vh` to `servicesTop − 0.15·vh` (smoothstep). `--fade-fg` flips ink → cream in the middle 8% of that ramp, so text keeps contrast.

### 6. Studio Approach (`#about`), `#0e0f13`
Grid `340px 1fr`, gap 96px, padding 72px 40px 150px. Left rail is sticky (top 120px) on desktop.
- "(STUDIO APPROACH)", then 19–23px statement at 85% cream: "Ahnoud Tech exists on one belief: *the brand* (Accent Ink, italic) and *the build* (Accent Draft, italic) should never be separated. One studio, from a solid identity and a reasoned design to the software and infrastructure that carry them." Mono tag "[ 04 STAGES • ONE STUDIO ]".
- **Stat carousel** (top rule 12%): number 600 `clamp(96px,9cqw,160px)` (mobile 88px) counts from the previous value over 520ms (ease-out cubic); caption 14px 62%; a 1px timer line fills over 4.5s; ← / → 44px circle buttons; "01 / 03".
  - 01: "Studio, with designers and engineers shipping together from kickoff to launch."
  - 02: "Working languages, English and Arabic, on every project."
  - 06: "Services, from brand identity through application DevOps."
  - Auto-advances every 4.5s; pauses on hover, focus, touch, when off-screen, or in a background tab. Horizontal swipe (>44px, mostly horizontal) steps on touch.
- **Stage accordion** (one open at a time, first open by default): rows with 1px rules at 12%. Header button grid `64px 1fr auto`, padding 24px 0: index "P/01" mono 11px; name 600 `clamp(30px,3.2cqw,54px)`; plus icon rotates 45° when open. Open row: background cream, text ink. Body expands via `grid-template-rows 0fr→1fr` (0.5s enter easing), text 16px. Swipe left/right steps between stages on touch.
  - Identity: Naming, voice, and identity systems: the brand foundations everything else is built on.
  - Design: Interfaces, websites, and 3D storytelling that carry the identity into product.
  - Build: Web development, AI agents, and automation, engineered to the same standard.
  - Operate: DevOps, infrastructure, and care after launch, so what we ship keeps running.

### 7. FAQ (`#faq`), `#0e0f13`
Grid `340px 1fr`. "(FAQ)" + `h2` "Common questions." Native `<details name="faq">` (one open at a time, first open). Summary 600 `clamp(18px,1.6cqw,24px)`, padding 24px 0, plus icon rotates 45°. Answer 16px, 72% cream, max 640px; height animates 0.45s where supported (`::details-content` + `interpolate-size`). Copy (keep identical to FAQPage schema):
1. What does Ahnoud Tech do? — Ahnoud Tech is a design and engineering studio. We take a company from brand identity and web design through web development, AI agents and automation, to the infrastructure that keeps it running.
2. Where is Ahnoud Tech based? — Our studio is at Building 14, 18 Street - Zaa'beel Second - Za'abeel - Dubai - UAE. We work with clients worldwide, in English and Arabic.
3. What is Kinomad Studio? — Kinomad Studio is our in-house team. It covers brand identity, web design, 3D visualization & animation, web development, AI agents & automation, and application DevOps.
4. Can one studio handle both design and development? — Yes. Design and engineering sit in one team, so a project moves from identity to launch and ongoing operations without changing vendors.
5. Do you support a product after launch? — Yes. Application DevOps covers deployment, infrastructure, and care after launch, so what we ship keeps running.
6. How do I start a project? — Use the Start a project button, email hello@ahnoud.com, or message us on WhatsApp or Telegram at +971 50 483 9038 with your goals, scope, and timing. We reply within two working days.

### 8. CTA
Height 1.8 × viewport (mobile 1.4×). Background image (grayscale, overlay `rgba(12,13,16,0.5→0.72)`). Sticky centred headline, 700 uppercase `clamp(54px,8.6cqw,150px)`, line-height 0.98: "Let's build" / "a brand," (indent 10%) / "and the system" (4%) / "→ behind it" (18%, slides right up to 12% of viewport width with scroll). Button "Start a project" (cream, 16px 26px, radius 12, 600 16px; hover lifts 3px and turns white) opens the modal.

### 9. Start a project modal
Scrim `rgba(12,13,16,0.72)` + blur 10px. Panel `min(640px,100%)`, padding `clamp(28px,4cqw,48px)`, `#0c0d10`, 1px border 14% cream, shadow `0 40px 120px rgba(0,0,0,0.6)`, scrolls internally. Tablet: padding 44px 40px. **Mobile: bottom sheet**, full width, max-height 92%, grab handle, slides up 0.42s.
- Content: mono "START A PROJECT"; `h2` "Tell us what you're building." (600 `clamp(30px,3.4cqw,44px)`); "We reply within two working days."
- Fields (underline inputs, 17px, focus turns the underline cream): NAME, EMAIL, COMPANY (optional), WHAT ARE YOU BUILDING? (textarea, placeholder "A few lines on goals, scope, and timing").
- Footer: links "or email hello@ahnoud.com" and "WhatsApp"; submit "Send enquiry" ("Sending…" while posting).
- Validation, in order: name required; email must match `^[^@\s]+@[^@\s]+\.[^@\s]+$`; brief required. Errors in `#eea563` with `role="alert"`.
- Submit: if a form endpoint is configured, POST JSON `{name, email, company, message, _subject}`; on success show "ENQUIRY SENT". Otherwise open a pre-filled `mailto:` and show "ENQUIRY READY" with a "Copy details" button. The success view draws a check mark (0.6s) and says "Thanks, {first name}."
- Open: fade/rise 0.45s. Close (×, scrim, Escape, Done): fade/drop 0.26s (sheet slides down 0.3s). Focus is trapped inside and returns to the trigger. Page scroll is locked while open.

### 10. Footer (`#contact`), `#0a0b0e`
Sticky under the page on desktop/tablet (revealed as `main` scrolls away); static on mobile. Padding 72px 40px 0. Grid `1.3fr 1fr`, gap 72px.
- Big nav: About / Studio / Services / Approach / Contact, `clamp(24px,2.4cqw,36px)` 500, rules at 10%, same left-sweep cream fill as Services (padding-left to 36px).
- (GET IN TOUCH): hello@ahnoud.com (underlined; COPY button → "COPIED" for 2s); +971 50 483 9038 (`tel:`); WHATSAPP (`https://wa.me/971504839038`) and TELEGRAM (`https://t.me/+971504839038`) outline pills that fill cream on hover; "One studio, from identity to DevOps. Working worldwide, in English and Arabic."
- (STUDIO): "Building 14, 18 Street / Zaa'beel Second - Za'abeel / Dubai - UAE", "Gulf Standard Time, GMT+4".
- (PART OF AHNOUD): cream button "Visit Ahnoud.com" → https://ahnoud.com.
- Bottom bar: live Dubai clock (updates every second), date; "Back to top"; "Booking projects for Q{next quarter} '{yy}"; "© 2024–{year} AHNOUD TECH".
- **Halftone strip**: cream band (min 240px, mobile 200px), canvas of dark squares whose size follows layered sine noise (cell 26px desktop, 13px ≤1024px). A glow (Gaussian, radius ~150px) follows the cursor (lerp 0.035). **Touch: taps do nothing; the glow follows the finger once it moves 8px** (lerp 0.12). On release the glow fades out in place. Logo left, "“The brand and the build, together.”" right (both `mix-blend-mode: difference`). The strip reveals bottom-up as you reach the page end. The animation runs only while visible and pauses in background tabs.

### 11. 404 page
`404.html`: standalone, same palette and halftone; `noindex`.

## Interactions & Behaviour (summary)
- In-page anchors smooth-scroll (instant for reduced motion) with a 56px scroll margin; "Contact" scrolls to the very end.
- Headings with `data-reveal` rise in via `clip-path` (0.9s). The observer watches the element's parent, because a fully clipped element never reports as intersecting.
- Touch: every section keeps vertical panning (`touch-action: pan-y pinch-zoom`); tap states replace hover.
- **Reduced motion:** no intro, parallax, count-up, auto-advance, bob, wipes, or height animation; modal and menu use a short fade.

## State
`modalOpen`, `modalClosing`, `formSent`, `sending`, `sentVia` (mail|form), form fields + `formError`; `menuOpen`, `menuClosing`; `statIdx`, `statPlay`, pause reasons (hover/focus/touch/off/hidden); `openStage`; `activeSec` (menu marker); `copied`, `copiedEnq`; `showIntro` (sessionStorage key `ahnoud-intro`). Scroll effects write styles directly in one rAF per scroll burst rather than re-rendering.

## Design Tokens
**Colours**
- Page `#0c0d10` · Dark section `#0e0f13` · Footer `#0a0b0e` · Hero panel `#101115`
- Cream `#e9e7e1` · Ink `#16171b` · Hover white `#ffffff`
- Accent Ink `#be5d09` (Kinomad/brand) · Accent Draft `#2d8ff0` (build, links on hover)
- Focus ring `#70b3f7` (2px, offset 3px) · Error `#eea563`
- Muted text: cream at 62% / 72% / 85%; rules at 8–14%

**Type**: General Sans (Fontshare) 400/500/600/700; micro-labels `ui-monospace, 'SF Mono', Menlo, monospace`. Labels 10–12px, tracking 0.1–0.14em. Body 14–17px, line-height 1.55–1.65. Headings: see sections (all `clamp()` on `cqw`).

**Spacing**: section padding 110–150px vertical / 40px horizontal (tablet 32px, mobile 20px); column gap 96px; row padding 24–26px.

**Radius**: 0 everywhere except primary buttons (12px), stat arrows (circle), and the founder photo (circle).

**Shadows**: nav `0 8px 32px rgba(0,0,0,0.18)` · hero bar `0 18px 44px rgba(0,0,0,0.35)` · main over footer `0 30px 60px rgba(0,0,0,0.55)` · modal `0 40px 120px rgba(0,0,0,0.6)`.

**Motion**: enter `cubic-bezier(0.22,1,0.36,1)`; in-out `cubic-bezier(0.65,0,0.35,1)`. Durations: 0.25s micro, 0.45s UI, 0.9–1.2s reveals.

## SEO requirements
Keep everything in the current `<head>`: title "Ahnoud Tech · Design & Engineering Studio in Dubai", meta/OG/Twitter description, canonical `https://ahnoudtech.com/`, hreflang en/x-default, geo meta, favicons, manifest, preloaded hero image per breakpoint, and the JSON-LD `@graph` (Organization, ProfessionalService + 6 Services, WebSite, WebPage, FAQPage). **Prerender the page to static HTML**, which also makes `seo-static.html` unnecessary. Ship `robots.txt`, `sitemap.xml`, `llms.txt`, `llms-full.txt` from the repo root.

## Assets
- `images/logo.svg` — wordmark (cream fill). Master: `assets/logo-source.svg` in the repo.
- `images/hero-*-{mobile,tablet,desktop}.webp`, `kinomad-studio-*.webp`, `cta-studio-*.webp` — Unsplash photos (free licence), placeholders until the studio supplies its own work. Mobile 780w, tablet 1200w (studio 820w), desktop 1920w (studio 1400w).
- `images/hannan-amiri.webp` / `.jpg` — founder, 480×480 crop.
- Favicons/app icons (light grey `#D4D4D4` tile, dark mark), `og-card.png` 1200×630.

## Files
All in this repository (see `README.md` for the full tree):
- `Ahnoud Tech Landing.dc.html` — the full design (head/SEO, template, styles, logic).
- `support.js` — runtime that renders the prototype (vendored).
- `image-slot.js` — image component used for every photo (`alt`, `priority`).
- `images/` — every image used on the site; `assets/` — source masters.
- `404.html` — not-found page.
- `seo-static.html`, `robots.txt`, `sitemap.xml`, `llms.txt`, `llms-full.txt`, `site.webmanifest` — SEO/GEO files.
- `Dockerfile`, `Caddyfile`, `docker-compose.yml`, `.github/workflows/deploy.yml` — deploy.
