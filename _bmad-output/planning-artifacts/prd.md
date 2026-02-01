---
stepsCompleted: ['step-01-init', 'step-02-discovery', 'step-03-success', 'step-04-journeys', 'step-05-domain', 'step-06-innovation', 'step-07-project-type', 'step-08-scoping', 'step-09-functional', 'step-10-nonfunctional', 'step-11-polish']
inputDocuments: ['assets/CV_Alexis_IMBERT.pdf']
workflowType: 'prd'
documentCounts:
  briefs: 0
  research: 0
  projectDocs: 0
  cv: 1
classification:
  projectType: 'static-website'
  subType: 'academic-portfolio-cv'
  domain: 'personal-academic'
  complexity: 'medium'
  projectContext: 'greenfield'
  stack:
    - jekyll
    - docker
    - docker-compose
    - github-pages
  targetAudience:
    - academic-recruiters
    - tech-ml-industry-recruiters
    - scientific-community
  contentPriority:
    - academic-career-research
    - publications
    - open-source-contributions
    - personal-projects
  stylePreferences:
    - modern
    - clean
    - easy-to-navigate
    - visual-with-images
---

# Product Requirements Document - alexis-imbert.github.io

**Author:** Aimbert
**Date:** 2026-02-01

## Executive Summary

**Project:** Personal academic portfolio and CV website for Alexis Imbert, PhD student in GNN/Neuroscience at INSA Rouen.

**Goal:** Centralize professional presence online to facilitate post-doc recruitment contacts and provide easy access to publications, projects, and code for the scientific community.

**Solution:** Multi-page static site built with Jekyll (al-folio theme), Docker for local development, and automatic deployment via GitHub Actions to GitHub Pages.

**Target Audiences:** Academic recruiters, Tech/ML industry recruiters, and scientific colleagues seeking publication resources.

**MVP Scope:** Homepage/CV, Publications (with PDF, HAL, DOI, BibTeX, slides, video, code links), Projects, Skills, Contact, and CV PDF download. Architecture prepared for future multilingual support (FR/EN/ES).

## Success Criteria

### User Success

| Audience | Success Criteria |
|----------|------------------|
| **Academic Recruiter** | Finds academic career + publications in < 30 seconds. Simple and intuitive navigation. |
| **Industry Recruiter (Tech/ML)** | Easily finds: experiences, technical skills, projects, open-source contributions. |
| **Scientific Colleague** | Quick access to paper links (for citation) + access to published code. |

### Business/Personal Success

| Criteria | Indicator |
|----------|-----------|
| **Primary Objective** | Centralize work + better visibility |
| **Expected Outcome (6 months)** | Contacts for post-docs at the end of PhD |
| **Primary Metric** | Professional site up-to-date and easily accessible ✅ |
| **Secondary Metric** | Number of visits (via GitHub Pages analytics) - nice-to-have |

### Technical Success

| Criteria | Target |
|----------|--------|
| **Update Frequency** | ~1x per month (new publications, projects) |
| **Ease of Maintenance** | Adding content must not be complicated |
| **Performance** | "Fast enough" - no extreme optimization needed |
| **i18n-ready Architecture** | Structure prepared for multilingual from MVP |

### Measurable Outcomes

- Site accessible and functional on GitHub Pages
- All CV content migrated and organized
- PDF download button working
- Docker Compose dev environment functional
- Architecture ready for easy addition of FR/EN/ES languages

## User Journeys

### Journey 1: Sophie - Research Director (Academic Recruiter)

**Persona:**

- Research director in Machine Learning or GNN (not necessarily neuroscience)
- Looking for a post-doc for an ANR project
- Saw your name in a recent publication

**Journey:**

| Step | Action | Need |
|------|--------|------|
| **Arrival** | Google "Alexis Imbert" or finds via publication | Clear landing page |
| **First Impression** | Immediately sees your research domain | Visible research section |
| **Exploration** | Checks your publications, verifies alignment with her domain | Publication list with links |
| **Validation** | Looks at academic career, supervision, skills | Academic career section |
| **Action** | Downloads CV PDF, contacts you by email | PDF button + visible contact |

---

### Journey 2: Marc - Tech Recruiter (Industry Recruiter)

**Persona:**

- Tech recruiter at an ML startup or large company
- Less scientific/technical background
- Looking for a versatile and operational profile

**Journey:**

| Step | Action | Need |
|------|--------|------|
| **Arrival** | LinkedIn, job posting you made, or search | Accessible profile |
| **First Impression** | Wants to see key info quickly | Synthetic homepage |
| **Exploration** | Looks for: teamwork, autonomy, Git, technical skills | Clear skills section |
| **Validation** | Looks at your **projects** (not papers), open-source contributions | Well-visible projects section |
| **Action** | Downloads CV PDF, contacts you by email | PDF button + contact |

---

### Journey 3: Thomas - Researcher (Scientific Colleague)

**Persona:**

- Researcher in a related field (GNN, neuroscience, ML)
- Read or wants to cite one of your papers
- Looking for associated resources

**Journey:**

| Step | Action | Need |
|------|--------|------|
| **Arrival** | Finds your site via a paper (link in the article) | Link from publications |
| **Exploration** | Looks for the paper PDF | Direct PDF link |
| **Deep Dive** | Wants the presentation slides | Slides/presentation link |
| **Bonus** | Presentation video if available | Video link (YouTube, etc.) |
| **Action** | Accesses the associated code | GitHub/repo link for project |

---

### Journey Requirements Summary

| Journey | Required Features |
|---------|-------------------|
| **Sophie (Academic)** | Research section, publication list, academic career, PDF button, contact |
| **Marc (Industry)** | Synthetic page, clear technical skills, highlighted projects, OS contributions, PDF button, contact |
| **Thomas (Scientific)** | For each publication: PDF link, slides link, video link (optional), GitHub code link |

**Key Insight:** Each **publication** must support multiple associated resources:

- 📄 Paper PDF
- 📊 Presentation slides
- 🎥 Video (optional)
- 💻 Code / GitHub Repository

## Domain-Specific Requirements

### SEO & Academic Visibility

| Requirement | Priority |
|-------------|----------|
| Good Google referencing (SEO basics) | High |
| Meta tags for academic discoverability | High |
| Links to ORCID profile | High |
| Links to ResearchGate profile | High |
| Links to Google Scholar profile | High |

### Publication Standards

| Requirement | Priority |
|-------------|----------|
| BibTeX export for each publication | High |
| HAL link for each publication | High |
| DOI indication for each publication | High |
| Structured citation format | Medium |

### Accessibility

| Requirement | Priority |
|-------------|----------|
| Basic WCAG compliance | Medium |
| Semantic HTML structure | Medium |
| Alt text for images | Medium |

### Privacy & RGPD

| Requirement | Implementation |
|-------------|----------------|
| Contact method | `mailto:` link (no form, no data collection) |
| Cookies | Minimal - no tracking cookies in MVP |
| Data collection | None - showcase site only |

## Static Website Specific Requirements

### Project-Type Overview

| Aspect | Decision |
|--------|----------|
| **Type** | Multi-page static site |
| **Generator** | Jekyll |
| **Hosting** | GitHub Pages |
| **Local Dev** | Docker / Docker Compose |
| **Deployment** | GitHub Actions (automatic build) |
| **Base Theme** | al-folio (academic-focused theme) |

### Site Architecture (MVP)

```
📁 Site Structure
├── 🏠 Home / CV (key info, summary)
├── 📄 Publications
│   ├── List of all publications
│   └── /publications/{slug}/ → Detailed page per publication
├── 💻 Projects
│   ├── List of all projects
│   └── /projects/{slug}/ → Detailed page per project
└── 📬 Contact (links)
```

### Out of Scope (MVP)

| Feature | Phase | Notes |
|---------|-------|-------|
| 🎓 Courses / Teaching section | Phase 2 | Not urgent, limited content for now |
| 📝 Blog section | Phase 2 | Future addition |
| 🌍 Multilingual (FR/EN/ES) | Phase 2 | Architecture prepared in MVP |
| 📊 Analytics | Phase 2 | Nice-to-have |
| 🔄 Auto PDF generation | Phase 3 | CV generated from site content |
| 📚 Auto-import publications | Phase 3 | From ORCID/HAL/Google Scholar |

### Content Management

| Element | Format | Structure |
|---------|--------|-----------|
| **Publications** | Markdown + YAML frontmatter | `_publications/2025-gbr-gnn.md` |
| **Projects** | Markdown + YAML frontmatter | `_projects/pixel-war.md` |
| **Courses** | Markdown or YAML data | `_data/courses.yml` or `_courses/` |
| **Blog** | Markdown + YAML frontmatter | `_posts/2026-02-01-title.md` |

### Publication Frontmatter Schema

```yaml
---
title: "Publication Title"
date: 2025-06-01
authors: ["Author 1", "Author 2"]
venue: "Conference/Journal Name"
# Required
pdf: "/assets/papers/paper.pdf"
hal: "https://hal.science/..."
doi: "10.1234/..."
bibtex: |
  @inproceedings{...}
# Optional
slides: "/assets/slides/presentation.pdf"
video: "https://youtube.com/..."
code: "https://github.com/..."
---
```

### Technical Architecture Considerations

| Aspect | Approach |
|--------|----------|
| **Jekyll Collections** | `_publications`, `_projects`, `_courses` |
| **Data files** | `_data/` for structured data (skills, timeline, etc.) |
| **Layouts** | `default`, `page`, `publication`, `project`, `post` |
| **Images** | `/assets/images/` - no automatic optimization for MVP |
| **i18n-ready** | Structure prepared (`_data/strings.yml` or plugin) |

### Build & Deployment

| Aspect | Implementation |
|--------|----------------|
| **Trigger** | Push to main branch |
| **Build** | Jekyll build in Docker container |
| **Deploy** | GitHub Pages automatic |
| **Local Dev** | `docker-compose up` for local preview |

### Implementation Considerations

- Start from **al-folio** theme as base
- Customize styling to match modern, clean aesthetic
- Ensure easy content addition via Markdown files
- Prepare i18n structure for future FR/EN/ES support
- Use Jekyll collections for organized content management

## Project Scoping & Phased Development

### MVP Strategy & Philosophy

**MVP Approach:** Problem-Solving MVP - minimum that allows each audience to find what they're looking for

**Resource Requirements:**

- 1 developer (with AI assistance for Jekyll customization)
- Familiarity with Markdown, Git, basic web concepts

### MVP Feature Set (Phase 1)

**Core User Journeys Supported:**

- Sophie (Academic Recruiter): Find publications, academic career, download CV
- Marc (Industry Recruiter): Find skills, projects, experiences, download CV
- Thomas (Scientific Colleague): Access paper PDF, slides, video, code

**Must-Have Capabilities:**

| Feature | Priority |
|---------|----------|
| Homepage with CV summary | P0 |
| Publications section (list + detail pages) | P0 |
| Publication resources (PDF, HAL, DOI, BibTeX, slides, video, code) | P0 |
| Projects section (list + detail pages) | P0 |
| Open-source contributions (within Projects) | P0 |
| Skills & Experiences sections | P0 |
| Contact page (mailto link) | P0 |
| CV PDF download button | P0 |
| Docker Compose local dev environment | P0 |
| GitHub Actions deployment | P0 |
| i18n-ready architecture | P0 |
| al-folio theme customization | P0 |

### Post-MVP Features

**Phase 2 (Growth):**

| Feature | Priority |
|---------|----------|
| Courses/Teaching section | High |
| Multilingual FR/EN/ES | High |
| Analytics (GitHub Pages insights) | Medium |
| Blog section | Medium |

**Phase 3 (Expansion):**

| Feature | Priority |
|---------|----------|
| Automatic PDF generation from site content | Medium |
| Auto-import publications from ORCID/HAL/Google Scholar | Low |

### Risk Mitigation Strategy

| Risk Type | Risk | Mitigation |
|-----------|------|------------|
| **Technical** | Jekyll/al-folio customization complexity | AI-assisted development, step-by-step guidance |
| **Technical** | Docker setup issues | Use proven docker-compose configurations |
| **Content** | Time to migrate all CV content | Start with essential content, iterate |
| **Maintenance** | Keeping site updated | Simple Markdown-based content, easy to edit |

## Functional Requirements

### Navigation & Site Structure

- FR1: Visitor can access the homepage with a CV summary
- FR2: Visitor can navigate between different sections via a menu
- FR3: Visitor can access the publications list
- FR4: Visitor can access the projects list
- FR5: Visitor can access contact information

### Publications

- FR6: Visitor can view the list of all publications
- FR7: Visitor can access a detailed page for each publication
- FR8: Visitor can download the PDF of a publication
- FR9: Visitor can access the HAL link of a publication
- FR10: Visitor can see the DOI of a publication
- FR11: Visitor can export the BibTeX citation of a publication
- FR12: Visitor can access presentation slides (if available)
- FR13: Visitor can access presentation video (if available)
- FR14: Visitor can access associated code/repository (if available)

### Projects

- FR15: Visitor can view the list of all projects
- FR16: Visitor can access a detailed page for each project
- FR17: Visitor can see technologies used per project
- FR18: Visitor can access the GitHub repository of a project (if available)

### Profile & Skills

- FR19: Visitor can view academic background
- FR20: Visitor can view professional experiences
- FR21: Visitor can view technical skills
- FR22: Visitor can view links to external profiles (ORCID, ResearchGate, Google Scholar, GitHub, LinkedIn)

### Download & Contact

- FR23: Visitor can download CV in PDF format
- FR24: Visitor can contact the site owner via email (mailto link)

### Content Management (Owner)

- FR25: Owner can add a new publication via Markdown file
- FR26: Owner can add a new project via Markdown file
- FR27: Owner can modify existing page content
- FR28: Owner can preview the site locally before publishing

### Deployment

- FR29: Site deploys automatically to GitHub Pages after a push
- FR30: Site is publicly accessible via alexis-imbert.github.io

## Non-Functional Requirements

### Performance

- NFR1: Pages must load in less than 3 seconds on a standard connection
- NFR2: Site must be optimized for search engine indexing (SEO)
- NFR3: Images must be compressed for fast loading

### Compatibility

- NFR4: Site must work on modern browsers (Chrome, Firefox, Safari, Edge)
- NFR5: Site must be responsive (mobile, tablet, desktop)

### Accessibility

- NFR6: Site must respect basic accessibility guidelines (contrast, keyboard navigation)
- NFR7: Images must have descriptive alt attributes
- NFR8: HTML structure must be semantic

### SEO & Visibility

- NFR9: Each page must have appropriate meta tags (title, description)
- NFR10: Site must be indexable by search engines
- NFR11: Publications must be structured for Google Scholar discoverability

### Maintainability

- NFR12: Adding a new publication should take no more than 10 minutes
- NFR13: Code must be organized and commented to facilitate modifications
- NFR14: Project documentation must allow easy onboarding
