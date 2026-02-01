# Story 1.1: Initialize Jekyll Site with al-folio Theme

**Status:** ready-for-dev  
**Epic:** 1 - Foundation & Site Structure  
**Story ID:** 1.1  
**Priority:** P0 - Foundation  
**Created:** 2026-02-01

---

## Story

As a site owner,
I want a Jekyll site initialized with the al-folio theme and basic configuration,
So that I have a working foundation to build my academic portfolio.

---

## Acceptance Criteria

1. **Given** an empty repository
   **When** the Jekyll site is initialized with al-folio theme
   **Then** the site structure follows al-folio conventions

2. **Given** the Jekyll site is initialized
   **When** `_config.yml` is examined
   **Then** it contains basic site settings (title, description, URL)

3. **Given** the configured Jekyll site
   **When** I run `bundle install && bundle exec jekyll build`
   **Then** the site builds successfully without errors

4. **Given** the built site
   **When** I serve it locally with `bundle exec jekyll serve`
   **Then** the site is accessible at `localhost:4000` and displays correctly

---

## Epic Context: Foundation & Site Structure

**Epic Goal:** Le site est accessible en ligne avec navigation fonctionnelle et architecture de base al-folio.

**Epic Coverage:**

- FR1: Visitor can access the homepage with a CV summary
- FR2: Visitor can navigate between different sections via a menu
- FR5: Visitor can access contact information
- FR29: Site deploys automatically to GitHub Pages after a push
- FR30: Site is publicly accessible via alexis-imbert.github.io

**Epic Outcome:** Le visiteur peut accéder au site et naviguer entre les sections principales.

**Story Sequence in Epic:**

1. **1.1** (THIS STORY) - Initialize Jekyll Site with al-folio Theme
2. **1.2** - Configure Docker Development Environment
3. **1.3** - Setup GitHub Actions Deployment
4. **1.4** - Create Homepage with Navigation

---

## Developer Context

### What is al-folio?

The **al-folio theme** is a Jekyll theme specifically designed for academic portfolios. It provides:

- Clean, modern design optimized for academic presentations
- Built-in support for Jekyll Collections (`_publications`, `_projects`, `_posts`)
- SEO-friendly structure with proper meta tags
- Responsive design (mobile, tablet, desktop)
- Accessibility features (semantic HTML, contrast)

**Key Features Provided by al-folio:**

- Base layouts: `default`, `page`, `post`, `publication`, `project`
- Data structures ready for: publications, projects, posts
- CSS/SCSS with responsive design
- Navbar and footer templates
- SEO optimization infrastructure

### Why al-folio for this project?

This project specifically chose al-folio because:

1. **Academic Focus** - Theme is designed for researchers and academics
2. **Publications Support** - Built-in collection for managing research papers
3. **Projects Showcase** - Built-in collection for personal projects
4. **SEO Ready** - Good structure for academic discoverability (Google Scholar, ORCID integration)
5. **Multilingual Prepared** - Structure ready for future i18n (FR/EN/ES)
6. **Low Customization Needed** - Minimal changes to base theme required for MVP
7. **Active Maintenance** - Well-maintained by academic community

---

## Technical Requirements

### Project Stack & Architecture

**Technology Stack (from PRD):**

```
Runtime:     Ruby + Jekyll 4.x
Theme:       al-folio (academic Jekyll theme)
Package Mgr: Bundler
Deployment:  GitHub Pages (automatic via GitHub Actions)
Dev Environment: Docker / Docker Compose
Repository Host: GitHub
```

**Directory Structure (al-folio conventions):**

```
alexis-imbert.github.io/
├── _config.yml              # Main Jekyll configuration
├── _layouts/                # Custom layouts (inherits from al-folio)
├── _includes/               # Reusable template components
├── _publications/           # Collection: research publications (Jekyll)
├── _projects/               # Collection: personal projects (Jekyll)
├── _posts/                  # Collection: blog posts (Jekyll)
├── _data/                   # YAML/JSON data files for structured content
│   ├── cv.yml              # CV timeline data
│   ├── skills.yml          # Technical skills by category
│   └── profiles.yml        # External profile links
├── assets/
│   ├── css/                # Stylesheets (Sass)
│   ├── js/                 # JavaScript
│   └── images/             # Images, logos, screenshots
├── _sass/                  # Sass partials (if customizing)
├── Gemfile                 # Ruby dependencies (managed by Bundler)
├── Gemfile.lock            # Locked dependency versions
├── index.md                # Homepage
├── README.md               # Documentation
├── Dockerfile              # Docker configuration (for Story 1.2)
└── .github/
    └── workflows/          # GitHub Actions (for Story 1.3)
```

### Configuration Strategy

**`_config.yml` - Essential Settings for MVP:**

```yaml
# Site Settings
title: "Alexis Imbert"
description: "PhD student in GNN and Neuroscience | Academic Portfolio"
url: "https://alexis-imbert.github.io"
baseurl: ""  # Important: empty for project GitHub Pages

# Author Info
author:
  name: "Alexis Imbert"
  email: "your-email@example.com"

# Theme
theme: al-folio
remote_theme: alshedivat/al-folio  # If using remote theme

# Collections (Publications, Projects)
collections:
  publications:
    output: true
    permalink: /publications/:slug/
  projects:
    output: true
    permalink: /projects/:slug/

# Markdown Processor
markdown: kramdown
kramdown:
  input: GFM
  syntax_highlighter: rouge

# Build Settings
exclude:
  - Dockerfile
  - docker-compose.yml
  - .gitignore
  - README.md
  - Gemfile

# SEO
lang: en
```

### Key Architecture Decisions

1. **Theme Choice: al-folio Remote**
   - Use `remote_theme: alshedivat/al-folio` OR local clone
   - Remote is simpler for updates but local gives more control
   - **Decision for Story 1.1:** Start with remote theme, can clone locally later if customizations needed

2. **Collections Configuration**
   - Enable `_publications` collection (required for Epic 3)
   - Enable `_projects` collection (required for Epic 4)
   - Standard al-folio permalink structure: `/publications/:slug/`, `/projects/:slug/`

3. **Base URL Management**
   - GitHub Project Pages require: `baseurl: ""` (since repo name = user.github.io)
   - Verify this with actual deployment in Story 1.3

4. **Gemfile Strategy**
   - Include `jekyll-remote-theme` gem if using remote_theme
   - Include `jekyll-seo-tag` for SEO optimization
   - Include `jekyll-paginate` if blog functionality needed

---

## Testing & Validation

### Local Build Validation

**Step 1: Install Dependencies**

```bash
cd alexis-imbert.github.io
bundle install
```

✓ Verify: No errors, all gems installed

**Step 2: Build Site**

```bash
bundle exec jekyll build
```

✓ Verify: Build completes without errors
✓ Output directory: `_site/` created with content

**Step 3: Local Server**

```bash
bundle exec jekyll serve
```

✓ Verify: Server starts on localhost:4000
✓ Verify: Site loads in browser without 404 errors
✓ Verify: CSS/JS loaded correctly (no missing assets)
✓ Verify: Base URL is correct in generated HTML

### Acceptance Verification

- [ ] **AC1:** Site structure follows al-folio conventions
  - [ ] `_config.yml` exists with valid YAML syntax
  - [ ] Collections `_publications` and `_projects` are configured
  - [ ] Layouts directory structure matches al-folio
  
- [ ] **AC2:** Basic site settings configured
  - [ ] `title`, `description`, `url` set in `_config.yml`
  - [ ] Author info configured
  - [ ] Language set to `en`
  
- [ ] **AC3:** Site builds successfully
  - [ ] `bundle install` completes without errors
  - [ ] `jekyll build` completes without errors
  - [ ] `_site/` directory contains generated HTML
  
- [ ] **AC4:** Site serves locally correctly
  - [ ] `jekyll serve` starts without errors
  - [ ] Site loads at `localhost:4000`
  - [ ] Static assets (CSS, JS) load correctly
  - [ ] No broken links to assets

---

## File Structure & Navigation

### Files Created/Modified

1. **New Project Root Files:**
   - `Gemfile` - Ruby dependencies (al-folio + required gems)
   - `Gemfile.lock` - Locked versions (will be auto-generated by bundler)
   - `_config.yml` - Jekyll configuration
   - `README.md` - Project documentation (basic)

2. **Directory Structure to Establish:**

   ```
   ├── _layouts/           # (inherits from al-folio, can be empty initially)
   ├── _includes/          # (inherits from al-folio, can be empty initially)
   ├── _publications/      # Empty directory (ready for stories 3.1+)
   ├── _projects/          # Empty directory (ready for stories 4.1+)
   ├── _posts/             # Empty directory (for future blog)
   ├── _data/              # Directory for data files (CV, skills)
   ├── assets/images/      # Directory for images
   └── assets/css/         # Empty (can override al-folio CSS if needed)
   ```

3. **Initial Homepage:**
   - `index.md` - Basic landing page (will be expanded in Story 1.4)

### Dependencies & Version Management

**`Gemfile` - Essential Gems:**

```ruby
source 'https://rubygems.org'

gem 'jekyll', '~> 4.2'           # Jekyll 4.2.x (latest stable)
gem 'al-folio', github: 'alshedivat/al-folio'  # al-folio theme from GitHub
gem 'webrick'                    # Required for jekyll serve on Ruby 3.x
gem 'jekyll-seo-tag'             # SEO tag support
gem 'jekyll-paginate'            # Pagination (if needed)

# Windows does not include zoneinfo files
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
```

### Configuration Compliance

**SEO & Academic Requirements (from PRD):**

- [ ] `jekyll-seo-tag` gem included for metadata
- [ ] Site title and description configured
- [ ] Author metadata set
- [ ] URL properly configured (baseurl empty for this setup)

**Accessibility Requirements (from PRD):**

- [ ] al-folio provides semantic HTML structure
- [ ] Responsive design built-in to al-folio
- [ ] Will be validated further when content is added

**Multilingual Preparation (from PRD):**

- [ ] Structure prepared (can add lang: en)
- [ ] i18n implementation deferred to future epic

---

## Dev Agent Record

### Work Completed

✅ **Story 1.1: Initialize Jekyll Site with al-folio Theme**

**Deliverables:**

- [ ] Project initialized with al-folio theme
- [ ] `_config.yml` created with essential configuration
- [ ] `Gemfile` with al-folio and required dependencies
- [ ] Directory structure established (empty collections ready)
- [ ] `index.md` created (basic homepage placeholder)
- [ ] `README.md` documenting setup
- [ ] Local build and serve verification passed
- [ ] Git repository initialized with initial commit

**Validation Checklist:**

- [ ] All Acceptance Criteria verified
- [ ] No build errors
- [ ] Site serves locally at localhost:4000
- [ ] al-folio theme properly loaded
- [ ] Collections configured and recognized

**Developer Notes:**

- Remember this is Story 1.1 of Epic 1 (Foundation)
- Next story (1.2) will add Docker environment
- Keep the initial setup minimal - customizations come in later stories
- Ensure Gemfile.lock is committed so Docker build can match exact versions

**Known Dependencies:**

- Ruby must be installed locally (for initial setup)
- Bundler must be available
- Git repository must be initialized

**Success Indicators:**

- `jekyll serve` runs without errors
- Browser loads localhost:4000 without 404s
- No missing assets (CSS/JS) in browser console
- `_config.yml` is valid YAML

---

## References & Research Notes

### al-folio Theme Documentation

- **GitHub Repo:** <https://github.com/alshedivat/al-folio>
- **Key Features:**
  - Academic portfolio theme
  - Multi-language support (i18n ready)
  - Collections for publications, projects, posts
  - SEO optimization built-in
  - Responsive design

### Jekyll + al-folio Setup Resources

- **Jekyll Official Docs:** <https://jekyllrb.com/docs/>
- **al-folio Documentation:** <https://github.com/alshedivat/al-folio/wiki>
- **Jekyll Collections:** <https://jekyllrb.com/docs/collections/>
- **GitHub Pages + Jekyll:** <https://docs.github.com/en/pages/using-jekyll-with-pages>

### Related Stories & Dependencies

- **Depends On:** None (first story in Epic)
- **Blocks:** All other stories in Epic 1 and downstream epics
- **Parallel Work:** No parallel work possible until this story is done

---

## Next Steps

Upon **completion** of this story:

1. **Verification by SM:** Confirm story acceptance criteria met
2. **Update Sprint Status:** Change story status from `ready-for-dev` to `in-progress`, then to `done`
3. **Update Epic Status:** Epic 1 automatically transitions to `in-progress`
4. **Proceed to Story 1.2:** Create Docker development environment setup

**Estimated Timeline:**

- Setup: ~30 minutes (if Ruby/Bundler already installed, ~1 hour otherwise)
- Building & Testing: ~15 minutes
- Total: ~45-75 minutes
