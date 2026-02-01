---
stepsCompleted: ['step-01-validate-prerequisites', 'step-02-design-epics', 'step-03-create-stories', 'step-04-final-validation']
inputDocuments: ['_bmad-output/planning-artifacts/prd.md']
---

# alexis-imbert.github.io - Epic Breakdown

## Overview

This document provides the complete epic and story breakdown for alexis-imbert.github.io, decomposing the requirements from the PRD into implementable stories.

## Requirements Inventory

### Functional Requirements

- FR1: Visitor can access the homepage with a CV summary
- FR2: Visitor can navigate between different sections via a menu
- FR3: Visitor can access the publications list
- FR4: Visitor can access the projects list
- FR5: Visitor can access contact information
- FR6: Visitor can view the list of all publications
- FR7: Visitor can access a detailed page for each publication
- FR8: Visitor can download the PDF of a publication
- FR9: Visitor can access the HAL link of a publication
- FR10: Visitor can see the DOI of a publication
- FR11: Visitor can export the BibTeX citation of a publication
- FR12: Visitor can access presentation slides (if available)
- FR13: Visitor can access presentation video (if available)
- FR14: Visitor can access associated code/repository (if available)
- FR15: Visitor can view the list of all projects
- FR16: Visitor can access a detailed page for each project
- FR17: Visitor can see technologies used per project
- FR18: Visitor can access the GitHub repository of a project (if available)
- FR19: Visitor can view academic background
- FR20: Visitor can view professional experiences
- FR21: Visitor can view technical skills
- FR22: Visitor can view links to external profiles (ORCID, ResearchGate, Google Scholar, GitHub, LinkedIn)
- FR23: Visitor can download CV in PDF format
- FR24: Visitor can contact the site owner via email (mailto link)
- FR25: Owner can add a new publication via Markdown file
- FR26: Owner can add a new project via Markdown file
- FR27: Owner can modify existing page content
- FR28: Owner can preview the site locally before publishing
- FR29: Site deploys automatically to GitHub Pages after a push
- FR30: Site is publicly accessible via alexis-imbert.github.io

### Non-Functional Requirements

- NFR1: Pages must load in less than 3 seconds on a standard connection
- NFR2: Site must be optimized for search engine indexing (SEO)
- NFR3: Images must be compressed for fast loading
- NFR4: Site must work on modern browsers (Chrome, Firefox, Safari, Edge)
- NFR5: Site must be responsive (mobile, tablet, desktop)
- NFR6: Site must respect basic accessibility guidelines (contrast, keyboard navigation)
- NFR7: Images must have descriptive alt attributes
- NFR8: HTML structure must be semantic
- NFR9: Each page must have appropriate meta tags (title, description)
- NFR10: Site must be indexable by search engines
- NFR11: Publications must be structured for Google Scholar discoverability
- NFR12: Adding a new publication should take no more than 10 minutes
- NFR13: Code must be organized and commented to facilitate modifications
- NFR14: Project documentation must allow easy onboarding

### Additional Requirements (from PRD Technical Sections)

**Stack & Infrastructure:**
- Jekyll static site generator with al-folio theme as base
- Docker / Docker Compose for local development
- GitHub Actions for automatic deployment
- GitHub Pages hosting

**Content Architecture:**
- Jekyll Collections: `_publications`, `_projects` (prepared for `_courses`)
- Data files in `_data/` for structured data (skills, timeline, etc.)
- Layouts: `default`, `page`, `publication`, `project`, `post`
- Images in `/assets/images/`
- i18n-ready structure prepared (for future FR/EN/ES)

**SEO & Academic Visibility:**
- Good Google referencing (SEO basics)
- Meta tags for academic discoverability
- Links to ORCID, ResearchGate, Google Scholar profiles

**Publication Standards:**
- BibTeX export for each publication
- HAL link for each publication
- DOI indication for each publication

**Publication Frontmatter Schema:**
```yaml
title, date, authors, venue, pdf, hal, doi, bibtex, slides (opt), video (opt), code (opt)
```

### FR Coverage Map

| FR | Epic | Description |
|----|------|-------------|
| FR1 | Epic 1 | Homepage avec CV summary |
| FR2 | Epic 1 | Navigation menu |
| FR3 | Epic 3 | Accès liste publications |
| FR4 | Epic 4 | Accès liste projets |
| FR5 | Epic 1 | Accès contact |
| FR6 | Epic 3 | Vue liste publications |
| FR7 | Epic 3 | Page détail publication |
| FR8 | Epic 3 | Download PDF publication |
| FR9 | Epic 3 | Lien HAL |
| FR10 | Epic 3 | DOI visible |
| FR11 | Epic 3 | Export BibTeX |
| FR12 | Epic 3 | Lien slides |
| FR13 | Epic 3 | Lien vidéo |
| FR14 | Epic 3 | Lien code/repo |
| FR15 | Epic 4 | Vue liste projets |
| FR16 | Epic 4 | Page détail projet |
| FR17 | Epic 4 | Technologies par projet |
| FR18 | Epic 4 | Lien GitHub projet |
| FR19 | Epic 2 | Parcours académique |
| FR20 | Epic 2 | Expériences pro |
| FR21 | Epic 2 | Skills techniques |
| FR22 | Epic 2 | Liens profils externes |
| FR23 | Epic 2 | Download CV PDF |
| FR24 | Epic 2 | Contact email |
| FR25 | Epic 5 | Ajout publication via MD |
| FR26 | Epic 5 | Ajout projet via MD |
| FR27 | Epic 5 | Modification contenu |
| FR28 | Epic 5 | Preview local |
| FR29 | Epic 1 | Deploy auto GitHub Actions |
| FR30 | Epic 1 | Site public GitHub Pages |

## Epic List

### Epic 1: Foundation & Site Structure
**Goal:** Le site est accessible en ligne avec navigation fonctionnelle et architecture de base al-folio.
**FRs covered:** FR1, FR2, FR5, FR29, FR30
**User outcome:** Le visiteur peut accéder au site et naviguer entre les sections principales.

### Epic 2: Profile & Professional Identity
**Goal:** Le visiteur découvre le parcours académique, les expériences et compétences, et peut télécharger le CV PDF.
**FRs covered:** FR19, FR20, FR21, FR22, FR23, FR24
**User outcome:** Sophie et Marc trouvent immédiatement le profil complet avec CV téléchargeable et liens vers profils externes.

### Epic 3: Publications Hub
**Goal:** Les publications sont listées et accessibles avec tous leurs ressources associées (PDF, HAL, DOI, BibTeX, slides, vidéo, code).
**FRs covered:** FR3, FR6, FR7, FR8, FR9, FR10, FR11, FR12, FR13, FR14
**User outcome:** Thomas (et Sophie) trouvent rapidement les papers avec toutes les ressources pour citation et reproduction.

### Epic 4: Projects Showcase
**Goal:** Les projets sont présentés avec détails techniques et liens GitHub.
**FRs covered:** FR4, FR15, FR16, FR17, FR18
**User outcome:** Marc découvre les projets concrets et contributions open-source avec accès direct au code.

### Epic 5: Content Management & Local Dev
**Goal:** Le propriétaire peut ajouter/modifier du contenu facilement et prévisualiser localement.
**FRs covered:** FR25, FR26, FR27, FR28
**User outcome:** Aimbert peut maintenir le site facilement avec workflow Docker local.

---

## Epic 1: Foundation & Site Structure

Le site est accessible en ligne avec navigation fonctionnelle et architecture de base al-folio.

### Story 1.1: Initialize Jekyll Site with al-folio Theme

As a site owner,
I want a Jekyll site initialized with the al-folio theme and basic configuration,
So that I have a working foundation to build my academic portfolio.

**Acceptance Criteria:**

**Given** an empty repository
**When** the Jekyll site is initialized with al-folio theme
**Then** the site structure follows al-folio conventions
**And** `_config.yml` contains basic site settings (title, description, URL)
**And** the site builds successfully locally

### Story 1.2: Configure Docker Development Environment

As a site owner,
I want a Docker Compose setup for local development,
So that I can preview and develop the site without installing Jekyll locally.

**Acceptance Criteria:**

**Given** a configured Jekyll site
**When** I run `docker-compose up`
**Then** the site is accessible at `localhost:4000`
**And** changes to files trigger automatic rebuild
**And** the environment matches production build settings

### Story 1.3: Setup GitHub Actions Deployment

As a site owner,
I want automatic deployment to GitHub Pages on push to main,
So that the site is always up-to-date without manual intervention.

**Acceptance Criteria:**

**Given** code is pushed to main branch
**When** GitHub Actions workflow triggers
**Then** Jekyll builds the site successfully
**And** the site is deployed to GitHub Pages
**And** the site is accessible at alexis-imbert.github.io

### Story 1.4: Create Homepage with Navigation

As a visitor,
I want a homepage with a CV summary and navigation menu,
So that I can quickly understand who Alexis is and navigate to other sections.

**Acceptance Criteria:**

**Given** I visit alexis-imbert.github.io
**When** the homepage loads
**Then** I see a brief CV summary/introduction
**And** I see a navigation menu with links to: Publications, Projects, Contact
**And** the page has proper meta tags (title, description)
**And** the navigation is responsive on mobile

---

## Epic 2: Profile & Professional Identity

Le visiteur découvre le parcours académique, les expériences et compétences, et peut télécharger le CV PDF.

### Story 2.1: Create About/CV Page with Academic Background

As a visitor (Sophie the academic recruiter),
I want to see Alexis's academic background and career path,
So that I can assess his research experience and academic qualifications.

**Acceptance Criteria:**

**Given** I navigate to the About/CV page
**When** the page loads
**Then** I see academic background (education, degrees, institutions)
**And** I see professional experiences (current position, previous roles)
**And** the content is structured with semantic HTML
**And** the page is accessible via navigation menu

### Story 2.2: Display Technical Skills Section

As a visitor (Marc the tech recruiter),
I want to see Alexis's technical skills organized by category,
So that I can quickly identify his technical competencies.

**Acceptance Criteria:**

**Given** I am on the About/CV page
**When** I scroll to the skills section
**Then** I see technical skills grouped by categories (Programming, ML/DL, Tools, etc.)
**And** each skill is clearly labeled
**And** the layout is readable on mobile devices

### Story 2.3: Add External Profile Links

As a visitor,
I want to access Alexis's external profiles (ORCID, ResearchGate, Google Scholar, GitHub, LinkedIn),
So that I can explore more about his work on other platforms.

**Acceptance Criteria:**

**Given** I am on the About/CV page or homepage
**When** I look for external profile links
**Then** I see clickable icons/links for: ORCID, ResearchGate, Google Scholar, GitHub, LinkedIn
**And** each link opens in a new tab
**And** icons have descriptive alt text for accessibility

### Story 2.4: Add CV PDF Download Button

As a visitor (Sophie or Marc),
I want to download Alexis's CV as a PDF,
So that I can save it for review or share it with colleagues.

**Acceptance Criteria:**

**Given** I am on the About/CV page or homepage
**When** I click the "Download CV" button
**Then** a PDF file downloads to my device
**And** the PDF contains the complete CV with proper formatting
**And** the button is prominently visible

### Story 2.5: Add Contact Information

As a visitor,
I want to easily contact Alexis via email,
So that I can reach out for opportunities or collaboration.

**Acceptance Criteria:**

**Given** I navigate to the Contact section (or see it on homepage)
**When** I click the contact link/button
**Then** my email client opens with Alexis's email pre-filled (mailto link)
**And** the contact information is easily findable
**And** no forms or data collection occurs

---

## Epic 3: Publications Hub

Les publications sont listées et accessibles avec tous leurs ressources associées (PDF, HAL, DOI, BibTeX, slides, vidéo, code).

### Story 3.1: Setup Publications Collection

As a site owner,
I want a Jekyll collection configured for publications,
So that I can manage publication content as structured Markdown files.

**Acceptance Criteria:**

**Given** the Jekyll site is configured
**When** I create the `_publications` collection in `_config.yml`
**Then** the collection is recognized by Jekyll
**And** a publication layout template is created
**And** frontmatter schema is defined (title, date, authors, venue, pdf, hal, doi, bibtex, slides, video, code)
**And** the collection is ready to receive publication files

### Story 3.2: Create Publications List Page

As a visitor (Sophie or Thomas),
I want to see a list of all publications,
So that I can browse Alexis's research output.

**Acceptance Criteria:**

**Given** I navigate to the Publications page
**When** the page loads
**Then** I see all publications listed in reverse chronological order
**And** each publication shows: title, authors, venue, date
**And** each publication has a link to its detail page
**And** the page is accessible from the main navigation
**And** the page has proper SEO meta tags

### Story 3.3: Create Publication Detail Page Template

As a visitor (Thomas the researcher),
I want to access a detailed page for each publication,
So that I can view all information and resources for that publication.

**Acceptance Criteria:**

**Given** I click on a publication from the list
**When** the detail page loads
**Then** I see the full publication information (title, authors, venue, date, abstract)
**And** the page uses semantic HTML structure
**And** each publication detail page has unique URL (`/publications/{slug}/`)
**And** the page has proper meta tags for Google Scholar discoverability

### Story 3.4: Add Publication Resources (PDF, HAL, DOI, BibTeX)

As a visitor (Thomas or Sophie),
I want to access the publication PDF, HAL link, DOI, and BibTeX citation,
So that I can read and cite the paper.

**Acceptance Criteria:**

**Given** I am on a publication detail page
**When** the resources section loads
**Then** I see a "Download PDF" button that downloads the paper PDF
**And** I see a clickable HAL link (if available)
**And** I see the DOI displayed with a link (if available)
**And** I see a "Copy BibTeX" button or expandable section
**And** clicking the BibTeX button copies the citation to clipboard or displays it
**And** the BibTeX is properly formatted
**And** missing resources are gracefully hidden (not showing broken links)

### Story 3.5: Add Optional Resources (Slides, Video, Code)

As a visitor (Thomas),
I want to access presentation slides, video, and code repository for a publication,
So that I can fully understand and reproduce the research.

**Acceptance Criteria:**

**Given** I am on a publication detail page
**When** optional resources are available
**Then** I see a "View Slides" link (if slides exist)
**And** I see a "Watch Presentation" link (if video exists)
**And** I see a "View Code" or GitHub link (if repository exists)
**And** these links open in new tabs
**And** if a resource is not available, it is not displayed

---

## Epic 4: Projects Showcase

Les projets sont présentés avec détails techniques et liens GitHub.

### Story 4.1: Setup Projects Collection

As a site owner,
I want a Jekyll collection configured for projects,
So that I can manage project content as structured Markdown files.

**Acceptance Criteria:**

**Given** the Jekyll site is configured
**When** I create the `_projects` collection in `_config.yml`
**Then** the collection is recognized by Jekyll
**And** a project layout template is created
**And** frontmatter schema is defined (title, description, technologies, github_url, demo_url, image)
**And** the collection is ready to receive project files

### Story 4.2: Create Projects List Page

As a visitor (Marc the tech recruiter),
I want to see a list of all projects,
So that I can explore Alexis's practical work and open-source contributions.

**Acceptance Criteria:**

**Given** I navigate to the Projects page
**When** the page loads
**Then** I see all projects displayed (grid or list layout)
**And** each project shows: title, brief description, thumbnail/image (if available)
**And** each project has a link to its detail page
**And** the page is accessible from the main navigation
**And** the page has proper SEO meta tags

### Story 4.3: Create Project Detail Page Template

As a visitor (Marc),
I want to access a detailed page for each project,
So that I can understand what the project does and the technologies used.

**Acceptance Criteria:**

**Given** I click on a project from the list
**When** the detail page loads
**Then** I see the project title, full description, and context
**And** I see the technologies/stack used clearly displayed
**And** the page uses semantic HTML structure
**And** each project detail page has unique URL (`/projects/{slug}/`)
**And** images or screenshots are displayed (if available)

### Story 4.4: Add GitHub Repository Links

As a visitor (Marc or Thomas),
I want to access the GitHub repository for a project,
So that I can view the source code and contributions.

**Acceptance Criteria:**

**Given** I am on a project detail page
**When** a GitHub repository is available
**Then** I see a prominent "View on GitHub" button or link
**And** the link opens the repository in a new tab
**And** if no repository link exists, the button is not displayed

---

## Epic 5: Content Management & Local Dev

Le propriétaire peut ajouter/modifier du contenu facilement et prévisualiser localement.

### Story 5.1: Create Documentation for Adding Publications

As a site owner,
I want clear documentation on how to add a new publication,
So that I can add content quickly without confusion.

**Acceptance Criteria:**

**Given** I want to add a new publication
**When** I read the documentation (README or CONTRIBUTING)
**Then** I see step-by-step instructions for creating a publication file
**And** I see the required frontmatter fields explained
**And** I see an example publication file
**And** adding a publication takes no more than 10 minutes

### Story 5.2: Create Documentation for Adding Projects

As a site owner,
I want clear documentation on how to add a new project,
So that I can showcase new work easily.

**Acceptance Criteria:**

**Given** I want to add a new project
**When** I read the documentation
**Then** I see step-by-step instructions for creating a project file
**And** I see the required frontmatter fields explained
**And** I see an example project file with image handling

### Story 5.3: Document Content Editing Workflow

As a site owner,
I want documentation on how to edit existing content,
So that I can update publications, projects, or pages confidently.

**Acceptance Criteria:**

**Given** I need to update existing content
**When** I consult the documentation
**Then** I see instructions for modifying Markdown files
**And** I understand how to update frontmatter vs content
**And** I know how to preview changes locally before publishing

### Story 5.4: Verify Docker Compose Local Preview

As a site owner,
I want the Docker Compose environment to work seamlessly,
So that I can preview changes locally before deploying.

**Acceptance Criteria:**

**Given** Docker and Docker Compose are installed
**When** I run `docker-compose up`
**Then** the site builds and is accessible at `localhost:4000`
**And** file changes trigger automatic rebuild (live reload)
**And** the local environment matches production settings
**And** instructions for using Docker are documented

### Story 5.5: Create README with Project Overview

As a new contributor or site owner,
I want a comprehensive README,
So that I understand the project structure and how to work with it.

**Acceptance Criteria:**

**Given** I open the repository
**When** I read the README.md
**Then** I see project description and purpose
**And** I see local development setup instructions (Docker)
**And** I see links to content management documentation
**And** I see deployment information (GitHub Pages)
**And** the code structure is explained

