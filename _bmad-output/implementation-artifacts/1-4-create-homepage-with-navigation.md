# Story 1.4: Create Homepage with Navigation

**Status:** ready-for-dev  
**Epic:** 1 - Foundation & Site Structure  
**Story ID:** 1.4  
**Priority:** P0 - Foundation  
**Created:** 2026-02-01  
**Depends On:** Stories 1.1, 1.2, 1.3 (Jekyll + Docker + Deployment)

---

## Story

As a visitor,
I want a homepage with a CV summary and navigation menu,
So that I can quickly understand who Alexis is and navigate to other sections.

---

## Acceptance Criteria

1. **Given** I visit `https://alexis-imbert.github.io` (or `localhost:4000` in development)
   **When** the homepage loads
   **Then** I see a brief CV summary/introduction visible above the fold

2. **Given** I am on the homepage
   **When** I look at the navigation menu
   **Then** I see clickable links to: Publications, Projects, Contact

3. **Given** I am on the homepage
   **When** the page loads
   **Then** the page has proper meta tags (title, description) for SEO

4. **Given** I visit the homepage on a mobile device
   **When** I view the navigation menu
   **Then** the navigation is responsive and readable on all screen sizes (mobile, tablet, desktop)

---

## Epic Context: Foundation & Site Structure

**Epic Goal:** Le site est accessible en ligne avec navigation fonctionnelle et architecture de base al-folio.

**Story Sequence in Epic:**

1. **1.1** - Initialize Jekyll Site with al-folio Theme ✅ (Completed)
2. **1.2** - Configure Docker Development Environment ✅ (Completed)
3. **1.3** - Setup GitHub Actions Deployment ✅ (Completed)
4. **1.4** (THIS STORY - FINAL) - Create Homepage with Navigation

**Why Homepage in Final Story of Epic?**

- Depends on all previous stories (Jekyll, Docker, Deployment working)
- Validates entire Epic 1 pipeline
- First content deployed by continuous deployment (Story 1.3)
- Sets foundation for future content (Epics 2-5)
- Establishes visual direction and navigation pattern

**Impact on User Journeys:**

- **Sophie (Academic Recruiter):** First impression critical - needs clear research identity
- **Marc (Tech Recruiter):** Homepage must be synthetic and highlight skills/projects
- **Thomas (Scientific Colleague):** Need clear path to publications

---

## Developer Context

### Homepage Purpose & Strategy

**What is a Homepage?**

The homepage is the **first impression** and **navigation hub**:

- Introduces the site owner and purpose
- Sets visual tone and credibility
- Guides visitors to content sections
- Demonstrates professionalism

**Design Strategy for This Project:**

Based on al-folio theme defaults, enhanced with:

- Clean, modern academic aesthetic
- Clear visual hierarchy
- Prominent navigation
- Fast-loading, minimal bloat
- Responsive design (mobile-first)
- SEO optimization

**Content Structure (Above-the-Fold):**

```
[HEADER - Navigation Bar]
├─ Logo/Site Title
├─ Nav Links: Publications, Projects, Contact
└─ (Optional: CV Download button)

[HERO Section]
├─ Name: Alexis Imbert
├─ Title: PhD Student in GNN & Neuroscience
├─ Subtitle: INSA Rouen Normandie
└─ Brief intro: 1-2 sentences about research focus

[CTA Section - Optional]
├─ Brief highlight of expertise areas
└─ Link to full CV/About page (Story 2.1)

[FOOTER]
├─ Quick links
├─ Social profiles
└─ Contact info
```

### al-folio Theme Navigation Structure

**al-folio Provides:**

- Navigation bar template (`_includes/navbar.html`)
- Responsive layout framework
- Mobile menu (hamburger) for small screens
- SEO infrastructure (with jekyll-seo-tag)

**What Story 1.4 Builds:**

- `index.md` - Homepage content (Markdown)
- `_data/nav_menu.yml` - Navigation menu configuration (if needed)
- `_includes/custom/footer.html` - Custom footer (optional)
- Meta tags (title, description in frontmatter)

### Jekyll + al-folio Homepage Setup

**Files Involved:**

1. **`index.md`** - Homepage content
   - Frontmatter with title, layout, meta tags
   - Markdown content (intro, summary)
   - al-folio interprets this as homepage

2. **`_config.yml` modifications** (from Story 1.1)
   - Add homepage-specific meta tags
   - Configure navigation menu links
   - Set site title and description

3. **Navigation Menu Configuration** (al-folio convention)
   - al-folio reads `_config.yml` for nav items
   - OR uses `_data/nav_menu.yml` if custom

**al-folio Navigation Pattern:**

```yaml
# In _config.yml
navbar:
  enabled: true

# Menu items (al-folio convention)
nav_menu:
  - title: "Home"
    href: "/"
  - title: "Publications"
    href: "/publications/"
  - title: "Projects"
    href: "/projects/"
  - title: "Contact"
    href: "/contact/"
```

---

## Technical Requirements

### Homepage File: `index.md`

```markdown
---
layout: default
title: "Alexis Imbert - PhD Student in GNN & Neuroscience"
description: "Academic portfolio showcasing research, publications, and projects. PhD student at INSA Rouen Normandie focused on Graph Neural Networks and Neuroscience."
permalink: /

# SEO Meta tags (jekyll-seo-tag will process these)
author:
  name: "Alexis Imbert"
  email: "your-email@example.com"

# OpenGraph tags for social sharing
og_image: "/assets/images/og-image.jpg"  # (optional, add later)
og_type: website

# Twitter Card (optional, add later)
twitter_card: summary_large_image
---

# Welcome to My Academic Portfolio

I'm **Alexis Imbert**, a PhD student in **Graph Neural Networks and Neuroscience** at INSA Rouen Normandie, Normandy, France.

My research focuses on applying Graph Neural Networks to neuroscience problems, exploring how neural data can be modeled and understood through graph-based deep learning approaches.

## Research Interests

- **Graph Neural Networks (GNNs)** - Architecture design, scalability, interpretability
- **Neuroscience Applications** - Neural data analysis, brain connectivity modeling
- **Deep Learning** - Representation learning, optimization, evaluation

## Quick Navigation

Explore my work through these sections:

- **📚 [Publications](/publications/)** - Research papers, preprints, and presentations
- **💻 [Projects](/projects/)** - Open-source contributions and technical projects
- **👤 [About & CV](/about/)** - Academic background, experiences, and skills

---

## Let's Connect

Interested in collaboration or have questions about my research?

📧 [Contact me via email](mailto:your-email@example.com)

Or find me on:
- **ORCID** - [ORCID profile link]
- **ResearchGate** - [ResearchGate profile link]
- **GitHub** - [GitHub profile link]
- **LinkedIn** - [LinkedIn profile link]

---

*Last updated: {{ site.time | date: "%B %Y" }}*
```

**Key Elements:**

1. **Frontmatter (YAML):**
   - `layout: default` - Uses al-folio default layout
   - `title` - Page title (also used as browser tab title)
   - `description` - Meta description for SEO
   - `permalink: /` - Sets this as homepage
   - `author`, `og_image` - SEO and social sharing

2. **Content Structure:**
   - H1 header with name and intro
   - Research interests section
   - Quick navigation with emoji icons
   - Contact section
   - Links to future pages (About, Publications, Projects)

3. **Responsive Elements:**
   - Markdown formatting is flexible
   - al-folio CSS handles responsive display
   - No custom CSS needed (theme handles it)

### Navigation Menu Configuration

**Option 1: al-folio Default Navigation**

al-folio automatically discovers nav items from Collections:

- Home (index.md)
- Publications (_publications collection)
- Projects (_projects collection)
- Posts (_posts collection)

Default al-folio navbar will show these automatically.

**Option 2: Custom Navigation (Optional)**

If custom menu needed, add to `_config.yml`:

```yaml
# Navigation menu items
navbar:
  enable: true

# Nav menu items (if custom order needed)
nav:
  - name: "Home"
    url: "/"
  - name: "Publications"
    url: "/publications/"
  - name: "Projects"
    url: "/projects/"
  - name: "Contact"
    url: "/contact/"
```

### SEO & Meta Tags Configuration

**`_config.yml` additions:**

```yaml
# Site metadata (used by jekyll-seo-tag)
title: "Alexis Imbert"
description: "Academic portfolio of PhD student in GNN and Neuroscience"
author:
  name: "Alexis Imbert"
  email: "your-email@example.com"

# For Google Scholar discoverability
og_image: "/assets/images/og-image.jpg"  # (add later)

# Twitter/Social sharing
twitter:
  username: "@your_twitter_handle"  # (optional, add later)

# Additional SEO
lang: en
```

**Meta Tags Generated (by jekyll-seo-tag):**

```html
<!-- Generated automatically -->
<title>Alexis Imbert - PhD Student in GNN & Neuroscience</title>
<meta name="description" content="Academic portfolio showcasing research, publications, and projects...">
<meta property="og:title" content="Alexis Imbert - PhD Student in GNN & Neuroscience">
<meta property="og:description" content="...">
<meta property="og:type" content="website">
<meta name="twitter:card" content="summary_large_image">
<!-- More tags... -->
```

### Responsive Design Strategy

**al-folio Mobile-First Approach:**

1. **Navbar Responsive**
   - Desktop: Horizontal nav bar
   - Tablet: Horizontal nav bar (smaller)
   - Mobile: Hamburger menu (toggle)

2. **Content Responsive**
   - Desktop: Full width content with margins
   - Tablet: Adjusted padding and margins
   - Mobile: Full width, stacked layout

3. **Typography Responsive**
   - Desktop: Larger fonts for readability
   - Mobile: Adjusted font sizes
   - All text readable without zoom

**CSS Breakpoints (al-folio):**

```css
/* Mobile first approach */
/* Mobile: < 576px (default) */
/* Tablet: >= 576px */
/* Desktop: >= 992px */
```

**Testing Responsive Design:**

- Use browser DevTools (F12 → Device Toolbar)
- Test on: iPhone SE (375px), iPad (768px), Desktop (1024px+)
- Verify: Text readable, nav works, images scale

---

## Testing & Validation

### Local Development Testing

**Step 1: Create index.md**

```bash
# From repo root
cat > index.md << 'EOF'
---
layout: default
title: "Alexis Imbert - PhD Student in GNN & Neuroscience"
description: "Academic portfolio..."
permalink: /
---

# Welcome to My Academic Portfolio
...
EOF
```

**Step 2: Build and Serve Locally**

```bash
# Using Docker (Story 1.2)
docker-compose up

# OR local Jekyll
bundle exec jekyll serve
```

**Step 3: Access in Browser**

- Navigate to `http://localhost:4000`
✓ Verify: Homepage loads without errors
✓ Verify: No 404 for assets
✓ Verify: Navigation menu visible

### Homepage Verification Checklist

- [ ] **AC1:** CV Summary visible above fold
  - [ ] User sees introduction immediately
  - [ ] Research focus clear
  - [ ] No scrolling needed to see main content
  
- [ ] **AC2:** Navigation menu present and clickable
  - [ ] Links to: Publications, Projects, Contact visible
  - [ ] Links are clickable (proper href)
  - [ ] Links go to correct pages (or 404 if page not created yet)
  
- [ ] **AC3:** Meta tags properly configured
  - [ ] Page title correct in browser tab
  - [ ] Meta description present (view page source)
  - [ ] og:title and og:description set
  - [ ] Character encoding correct
  
- [ ] **AC4:** Responsive design works
  - [ ] Desktop (1024px+): Full layout, horizontal nav
  - [ ] Tablet (576px): Adjusted layout, nav responsive
  - [ ] Mobile (375px): Hamburger menu, readable text
  - [ ] No horizontal scrolling on mobile

### SEO Validation

**Check Meta Tags:**

```bash
# View page source
curl http://localhost:4000 | grep -A2 "<meta"
```

**Expected Output:**

```html
<meta charset="utf-8">
<meta name="description" content="Academic portfolio...">
<meta property="og:title" content="Alexis Imbert...">
```

**Browser DevTools Check:**

1. F12 → Console
2. Right-click page → View Page Source
3. Look for `<meta name="description">`
4. Verify: Description text present

### Mobile Responsiveness Testing

**Using Browser DevTools:**

1. Press F12 (DevTools)
2. Click device icon (Ctrl+Shift+M or toggle toolbar)
3. Select device: iPhone SE (375px), iPad (768px)
4. Test on each:
   - [ ] Navigation menu accessible
   - [ ] Text readable without zoom
   - [ ] Images scale properly
   - [ ] Buttons clickable

**Using Physical Device (Optional):**

1. Find your machine IP: `ipconfig getifaddr en0` (macOS) or `hostname -I` (Linux)
2. On mobile, navigate to: `http://<your-ip>:4000`
3. Verify: Homepage displays correctly

### Production Testing (After Deployment)

**Step 1: Push to GitHub**

```bash
git add index.md
git commit -m "Add homepage with navigation"
git push origin main
```

**Step 2: Wait for Deployment**

- Check Actions tab for workflow completion (~2-3 minutes)

**Step 3: Verify Public Site**

- Navigate to: `https://alexis-imbert.github.io`
✓ Verify: Homepage loads
✓ Verify: Navigation links work
✓ Verify: Meta tags present (View Page Source)
✓ Verify: Responsive on mobile

---

## File Structure & Dependencies

### Files Created/Modified

1. **New Files:**
   - `index.md` - Homepage content
   - `_data/` - Directory for structured data (if needed)

2. **Modified Files:**
   - `_config.yml` - Add homepage meta tags, site title/description

3. **Optional Additions (Future):**
   - `assets/images/og-image.jpg` - OpenGraph image (Story 2+)
   - `_includes/custom/footer.html` - Custom footer (Story 2+)

### Dependencies

**Required (from Stories 1.1-1.3):**

- Jekyll site initialized (1.1)
- Docker environment working (1.2)
- GitHub Actions deployment configured (1.3)

**al-folio Features Used:**

- Default layout
- Navbar component
- Responsive CSS
- jekyll-seo-tag (for meta tags)

**No Additional Gems Needed** - al-folio provides everything

### Files NOT Yet Created

**These are created in Future Stories:**

- `/publications/` - Created in Epic 3
- `/projects/` - Created in Epic 4
- `/about/` or `/cv/` - Created in Epic 2 (Story 2.1)
- `/contact/` - Created in Epic 2 (Story 2.5)

**Navigation Links in Story 1.4:**

- Can point to future pages (will be 404 until those stories completed)
- OR can be commented out until pages exist
- al-folio automatically adds Collection links once collections exist

---

## Architecture Compliance

### al-folio Homepage Convention

- `index.md` - Standard Jekyll homepage
- Layout: `default` (provided by al-folio)
- Permalink: `/` (root of site)
- No custom CSS needed (al-folio theme handles styling)

### Jekyll Conventions Followed

- Markdown content in root directory
- YAML frontmatter for metadata
- jekyll-seo-tag processes meta tags
- Responsive design from theme (not custom CSS)

### Navigation Pattern

- al-folio discovers Collections automatically
- OR custom nav defined in `_config.yml`
- No database needed (static generation)
- All links resolved at build time

### SEO Best Practices Implemented

- Unique title and description per page
- Proper meta tags (title, description, og:*)
- Semantic HTML (al-folio provides)
- Mobile responsive design
- Fast load time (no JavaScript overhead)

---

## Dev Agent Record

### Work Completed

✅ **Story 1.4: Create Homepage with Navigation**

**Deliverables:**

- [ ] `index.md` created with homepage content
- [ ] Frontmatter includes title, description, permalink
- [ ] CV summary/introduction clearly visible
- [ ] Navigation menu links to: Publications, Projects, Contact
- [ ] Meta tags properly configured in frontmatter
- [ ] _config.yml updated with site title/description
- [ ] Homepage responsive on mobile/tablet/desktop
- [ ] No build errors when serving locally
- [ ] Site deployed to GitHub Pages successfully

**Validation Checklist:**

- [ ] All Acceptance Criteria verified
- [ ] `docker-compose up` or `jekyll serve` builds homepage without errors
- [ ] Homepage loads at localhost:4000 (development) or public URL (production)
- [ ] Navigation menu visible and clickable
- [ ] Meta tags present in HTML (View Page Source)
- [ ] Responsive design works on mobile, tablet, desktop
- [ ] No 404 errors for assets
- [ ] GitHub Actions deployment successful

**Developer Notes:**

- al-folio theme automatically discovers Collections (Publications, Projects)
- Navigation links can point to future pages (will work once those pages created)
- SEO tags automatically processed by jekyll-seo-tag gem
- Responsive design is built-in to al-folio theme
- No custom CSS needed for basic homepage

**Key Configuration Points:**

- `index.md` at repository root
- `layout: default` uses al-folio theme
- `permalink: /` makes it the homepage
- frontmatter metadata for SEO
- Description < 160 characters for Google preview

**Success Indicators:**

- Homepage displays at root URL `/`
- Navigation menu visible in navbar
- Title appears in browser tab
- Page description visible in View Page Source
- Mobile menu works (hamburger on small screens)
- No console errors in browser DevTools

**Troubleshooting Guide:**

| Problem | Solution |
|---------|----------|
| Homepage not showing | Verify `index.md` in root, `permalink: /` in frontmatter |
| Meta tags missing | Ensure jekyll-seo-tag gem in Gemfile, frontmatter has title/description |
| Navigation not showing | Verify al-folio navbar enabled in _config.yml |
| Mobile menu broken | Check al-folio version, verify responsive CSS loaded |
| Build fails | Check frontmatter YAML syntax (valid indentation) |

---

## References & Research Notes

### al-folio Homepage Customization

- **al-folio Documentation:** <https://github.com/alshedivat/al-folio>
- **Customizing Homepage:** <https://github.com/alshedivat/al-folio/wiki/customization>
- **Navigation Setup:** <https://github.com/alshedivat/al-folio/blob/main/_config.yml>

### Jekyll SEO & Meta Tags

- **jekyll-seo-tag Documentation:** <https://github.com/jekyll/jekyll-seo-tag>
- **OpenGraph Meta Tags:** <https://ogp.me/>
- **Twitter Cards:** <https://developer.twitter.com/en/docs/twitter-for-websites/cards>

### Responsive Design

- **Mobile-First Design:** <https://www.uxpin.com/studio/blog/responsive-mobile-first-design/>
- **Viewport Meta Tag:** <https://developer.mozilla.org/en-US/docs/Web/HTML/Viewport_meta_tag>
- **Bootstrap Breakpoints (used by al-folio):** <https://getbootstrap.com/docs/5.0/layout/breakpoints/>

---

## Epic 1 Completion Summary

With Story 1.4 complete, **Epic 1: Foundation & Site Structure** is DONE! ✅

### Epic 1 Achievements

✅ **Story 1.1** - Jekyll site initialized with al-folio theme
✅ **Story 1.2** - Docker Compose development environment
✅ **Story 1.3** - GitHub Actions continuous deployment
✅ **Story 1.4** - Homepage with navigation and SEO (THIS STORY)

### Foundation Ready for Future Work

With Epic 1 complete:

- ✅ Site infrastructure in place (Jekyll + al-folio)
- ✅ Development environment available (Docker)
- ✅ Deployment pipeline automated (GitHub Actions)
- ✅ Homepage and navigation established
- ✅ All future content can be added and deployed automatically

### Next Epics Unblocked

**Epic 2** (Profile & Professional Identity) can now add:

- About/CV page
- Technical skills
- External profile links
- CV download button
- Contact information

**Epic 3** (Publications Hub) can now add:

- Publications collection
- Publication detail pages
- PDF, HAL, DOI, BibTeX links

**Epic 4** (Projects Showcase) can now add:

- Projects collection
- Project detail pages
- GitHub links

**Epic 5** (Content Management) focuses on:

- Documentation for adding content
- Local preview verification
- Project README

---

## Estimated Timeline

- Create index.md: ~10 minutes
- Update _config.yml: ~5 minutes
- Test locally: ~5-10 minutes
- Verify deployment: ~5-10 minutes
- Total: ~25-35 minutes

---

## Congratulations! 🎉

Epic 1: Foundation & Site Structure is complete!

The project now has:

- ✅ Full development and deployment pipeline
- ✅ Public GitHub Pages site
- ✅ Professional homepage with navigation
- ✅ SEO-optimized structure
- ✅ Mobile-responsive design

Ready to move forward with content creation in Epics 2-5!
