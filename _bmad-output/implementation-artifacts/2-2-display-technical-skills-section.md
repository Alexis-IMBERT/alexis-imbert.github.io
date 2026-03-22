# Story 2.2: Display Technical Skills Section

---
Status: ready-for-dev
---
**Epic:** 2 - Profile & Professional Identity  
**Story ID:** 2.2  
**Priority:** P0 - Core Profile  
**Created:** 2026-03-22  
**Depends On:** Story 2.1 (About/CV page baseline)  

---

## Story

As a visitor (Marc the tech recruiter),
I want to see Alexis's technical skills organized by category,
so that I can quickly identify his technical competencies.

---

## Acceptance Criteria

1. **Given** I am on the About/CV page  
   **When** I scroll to the skills section  
   **Then** I see technical skills grouped by categories (Programming, ML/DL, Tools, etc.)

2. **Given** the skills section is displayed  
   **When** I read each item  
   **Then** each skill is clearly labeled

3. **Given** I visit the About/CV page on mobile (<= 768px)  
   **When** the skills section renders  
   **Then** the layout remains readable and usable without horizontal scroll

---

## Tasks / Subtasks

- [ ] Create a structured skills dataset in `_data/skills.yml` with clear categories and ordered skill lists (AC: 1, 2)
- [ ] Implement About/CV page rendering logic using `site.data.skills` (AC: 1, 2)
- [ ] Apply responsive styling for category blocks and skill items (AC: 3)
- [ ] Add semantic headings and list markup for accessibility (AC: 2, 3)
- [ ] Validate locally with Docker preview (`docker compose up`) on desktop and mobile viewport (AC: 1, 2, 3)

---

## Developer Context

### Story Foundation

- Epic objective: strengthen professional identity by making profile information immediately scannable for recruiters.
- This story operationalizes FR21 from PRD: visible technical skills.
- Current repository state: `_data/skills.yml` exists but is empty (whitespace only), so data source must be populated.
- No existing About page file was found in the repository at creation time; dev must either:
  - implement in the About page introduced by Story 2.1 if present in local changes/branch context, or
  - create a conventional page file (for example `about.md`) and wire it in navigation if missing.

### Technical Requirements

- Data source MUST be `_data/skills.yml` (single source of truth for skills content).
- Skills data shape should be simple and Liquid-friendly. Recommended schema:

```yaml
categories:
  - name: "Programming"
    items:
      - "Python"
      - "R"
      - "SQL"
  - name: "Machine Learning / Deep Learning"
    items:
      - "PyTorch"
      - "scikit-learn"
      - "Graph Neural Networks"
  - name: "Tools"
    items:
      - "Git"
      - "Docker"
      - "Linux"
```

- Render categories with semantic structure:
  - section heading (H2 for "Technical Skills")
  - category headings (H3)
  - unordered lists for skill items
- Keep implementation static and Jekyll-native; do not add JS framework dependencies.
- Keep styling aligned with current theme and existing CSS architecture.

### Architecture Compliance

- Stack constraints from current repo:
  - Jekyll `~> 4.3` (Gemfile)
  - al-folio via `jekyll-remote-theme`
  - `jekyll-seo-tag` enabled
- Respect existing project structure:
  - content/data in `_data/`
  - layout logic in `_layouts/` and includes in `_includes/`
  - page content in markdown pages
- Do not introduce tabs in YAML files; use spaces only.

### Library / Framework Requirements

- Jekyll Data Files usage: consume `_data/skills.yml` via `site.data.skills`.
- Keep compatibility with current Jekyll 4.x behavior and existing plugin set.
- No additional gems required for this story.

### File Structure Requirements

- Must touch:
  - `_data/skills.yml` (populate structured content)
- Likely touch (depending on existing Story 2.1 outcome):
  - About/CV page file (e.g., `about.md` or equivalent)
  - optional style override file if needed for responsive layout
- Must not break:
  - `index.md`
  - `_includes/header.html`
  - existing collection routes in `_config.yml`

### Testing Requirements

- Functional checks:
  - skills categories visible on About/CV page
  - each skill displayed as readable text label
- Responsive checks:
  - mobile viewport 375px and tablet viewport 768px
  - no clipping or horizontal overflow in skills section
- Regression checks:
  - homepage still renders
  - navigation still works
  - site build succeeds with Docker

---

## Git Intelligence Summary

Recent commits indicate stable patterns to preserve:

- `28e36d1` Retrospective Epic 1
- `f488a6a` Stories 1.3 & 1.4
- `91c68f4` Story 1.2
- `bc762f2` Story 1.1

Implication for this story:

- keep incremental, focused edits;
- preserve the existing Jekyll + Docker workflow;
- avoid broad refactors while introducing skills section.

---

## Latest Technical Information

- Jekyll Data Files best practice confirms `_data/*.yml` is first-class for structured content and accessible in templates through `site.data.*`.
- Jekyll SEO Tag supports page-level `title` and `description`; if About page is updated/created, ensure these are present in front matter.
- al-folio upstream remains active (latest release visible as v0.16.3 on fetched repository metadata), so keep customizations minimal and local to avoid future merge friction.

---

## Project Context Reference

- No concrete `project-context.md` file was found in this repository.
- Context source priority used for this story:
  1. `_bmad-output/planning-artifacts/epics.md`
  2. `_bmad-output/planning-artifacts/prd.md`
  3. current repository implementation state

---

## Dev Notes

- Primary implementation objective is clarity and scannability for recruiters.
- Prefer data-driven rendering over hardcoded HTML skill blocks.
- Keep content maintainable: adding/removing skills should require editing only `_data/skills.yml`.

---

## Dev Agent Record

### Agent Model Used

GPT-5.3-Codex

### Debug Log References

- Story generated from create-story workflow execution with explicit story selection `2.2`.

### Completion Notes List

- Ultimate context analysis completed with PRD + epics + repo-state + git-history inputs.
- Story status set directly to `ready-for-dev` as required by workflow.

### File List

- _bmad-output/implementation-artifacts/2-2-display-technical-skills-section.md
