# Story 2.4: Add CV PDF Download Button

---
Status: ready-for-dev
---
**Epic:** 2 - Profile & Professional Identity
**Story ID:** 2.4
**Priority:** P0 - Profile Conversion
**Created:** 2026-03-22
**Depends On:** Story 2.1 (About/CV page), Story 2.2 (Skills section), Story 2.3 (External links)

---

## Story

As a visitor (Sophie or Marc),
I want to download Alexis's CV as a PDF,
So that I can save it for review or share it with colleagues.

---

## Acceptance Criteria

1. **Given** I am on the About/CV page or homepage
   **When** I click the "Download CV" button
   **Then** a PDF file downloads to my device

2. **Given** I download the CV PDF
   **When** I open the file
   **Then** the PDF contains the complete CV with proper formatting

3. **Given** I am a first-time visitor
   **When** the page renders
   **Then** the download button is prominently visible and easy to identify

---

## Story Requirements

### Functional Requirements

- Add a visible "Download CV" CTA on at least one currently accessible page (homepage is already live; About page can be added by Story 2.1).
- Link CTA to the existing static file `assets/CV_Alexis_IMBERT.pdf`.
- Use a direct URL resolved with Jekyll's `relative_url` filter to preserve compatibility with `baseurl` changes.
- Keep link behavior resilient across desktop and mobile.

### Non-Functional Requirements

- Maintain responsive usability and touch target size suitable for mobile.
- Preserve existing SEO/frontmatter behavior of pages.
- Keep implementation low-complexity (no JS required for download action).

### Scope Boundaries

- In scope: expose and style a CV download button and verify file delivery.
- Out of scope: regenerate CV PDF content, build dynamic PDF generation, add analytics tracking.

---

## Developer Context

### Existing Implementation Intelligence

- CV PDF already exists in repository: `assets/CV_Alexis_IMBERT.pdf`.
- Homepage exists and is deployed through current pipeline (`index.md` + Jekyll build).
- Navigation/menu currently managed by `site.nav_menu` in `_config.yml` and rendered in `_includes/header.html`.
- Global visual styles are currently centralized in `_layouts/default.html` with responsive breakpoints at 768px and 480px.

### Business Context in Epic 2

- Epic 2 goal: make professional profile immediately consumable for recruiters.
- Story 2.4 directly supports FR23 from PRD (download CV in PDF format).
- Recruiter journeys (Sophie, Marc) require immediate access to CV without friction.

---

## Technical Requirements

- Implement CTA with semantic anchor to a real file URL, not a fake button.
- Preferred pattern:
  - `href="{{ '/assets/CV_Alexis_IMBERT.pdf' | relative_url }}"`
  - `download="CV_Alexis_IMBERT.pdf"`
- Ensure label text is explicit (example: "Download CV (PDF)") for accessibility and clarity.
- If adding iconography, include meaningful alternative text and preserve text label.
- Maintain existing markdown + frontmatter conventions.

---

## Architecture Compliance

- Respect current Jekyll/al-folio structure and avoid introducing new framework dependencies.
- Do not move the current PDF asset path unless all references are updated.
- Preserve existing layout and SEO pipeline (`jekyll-seo-tag` plugin already active).
- Follow static-site constraints: no server-side download endpoint, no runtime dependency.

---

## Library and Framework Requirements

- Jekyll/Liquid:
  - Use `relative_url` for robust path generation.
- HTML anchor behavior:
  - `download` works for same-origin resources and is appropriate for this static PDF use case.
- Browser behavior:
  - Some browsers may open PDFs inline depending on settings; acceptance should validate user can obtain/save file.

---

## File Structure Requirements

### Expected Files to Modify

- `index.md` (recommended location for immediate value)
- Optional later extension when Story 2.1 is completed: About page markdown file (once created)
- Optional styling touchpoints only if needed:
  - `_layouts/default.html` (if adding shared button style)
  - `assets/css/main.css` (preferred if style consolidation is done in this project)

### Files That Must Not Be Changed Unnecessarily

- `_config.yml` nav entries (unless product decision changes IA)
- `_includes/header.html` logic (unless CTA is intentionally added to global header)
- Existing publication/project collection settings

---

## Testing Requirements

### Manual Validation

- Verify button is visible on desktop and mobile viewport widths.
- Verify click downloads or opens `CV_Alexis_IMBERT.pdf` with a clear user path to save.
- Verify link is not broken in local Docker preview and generated site output.

### Automated Validation (Recommended)

- Add/update shell spec similar to existing style under `spec/`:
  - Confirm rendered homepage contains a link to `/assets/CV_Alexis_IMBERT.pdf`.
  - Confirm link text mentions CV and PDF.
  - Optional: `curl -I` on local preview path returns `200`.

### Regression Checks

- Confirm homepage navigation links still render as before.
- Confirm no regression in responsive menu toggle behavior.

---

## Previous Story Intelligence

No Story 2.3 implementation artifact exists yet in `implementation-artifacts`; therefore no same-epic prior dev notes are available.

Actionable adaptation:
- Use established implementation quality bar from Epic 1 artifacts (AC-driven checks, explicit SEO/accessibility checks, and concrete test script updates in `spec/`).

---

## Git Intelligence Summary

Recent commits analyzed:
- `28e36d1` Retrospective Epic 1
- `f488a6a` Stories 1.3 & 1.4
- `91c68f4` Story 1.2
- `bc762f2` Story 1.1

Observed patterns to follow:
- Story work is grouped with explicit artifact progression.
- Implementation tends to include both content updates and validation scripts.
- Structure and naming conventions are stable; incremental changes are preferred over broad refactors.

---

## Latest Tech Information

Web references used for current guardrails:
- MDN `<a>` element guidance confirms:
  - `download` attribute is valid for same-origin file URLs.
  - Clear link text is required for accessibility.
- Jekyll docs confirm:
  - `relative_url` should be used for site-path robustness with `baseurl`.

Implementation implication:
- Use a semantic anchor with explicit destination and `download` attribute, backed by existing static PDF in `assets/`.

---

## Project Context Reference

No `project-context.md` file was discovered in the workspace. Story context was derived from:
- `_bmad-output/planning-artifacts/epics.md`
- `_bmad-output/planning-artifacts/prd.md`
- `_config.yml`
- Existing implementation artifacts and review summaries

---

## Tasks / Subtasks

- [ ] Add CV download CTA in homepage content (AC: 1, 3)
  - [ ] Add explicit anchor text "Download CV (PDF)"
  - [ ] Link to `{{ '/assets/CV_Alexis_IMBERT.pdf' | relative_url }}`
  - [ ] Add `download` attribute
- [ ] Ensure visual prominence and responsive usability (AC: 3)
  - [ ] Validate desktop visibility
  - [ ] Validate mobile visibility (<= 768px and <= 480px)
- [ ] Verify file correctness and end-user behavior (AC: 1, 2)
  - [ ] Confirm target PDF exists and opens correctly
  - [ ] Confirm user can save local copy from browser flow
- [ ] Add/extend validation script in `spec/` (AC: 1, 3)
  - [ ] Check rendered link path and text
  - [ ] Optional HTTP status check in local preview

---

## Dev Notes

- Do not implement fake button behavior with `href="#"` or JS-only click handlers.
- Avoid introducing new dependencies for a static-file download.
- Keep CTA wording explicit for recruiter audience and accessibility tools.

### References

- Source: `_bmad-output/planning-artifacts/epics.md` (Epic 2, Story 2.4)
- Source: `_bmad-output/planning-artifacts/prd.md` (FR23, recruiter journeys)
- Source: `_config.yml` (Jekyll plugins/config)
- Source: `index.md` (homepage content location)
- Source: `assets/CV_Alexis_IMBERT.pdf` (download target)
- Source: MDN HTML `<a>` documentation (download, accessibility)
- Source: Jekyll Liquid filters docs (`relative_url`)

---

## Dev Agent Record

### Agent Model Used

GPT-5.3-Codex

### Debug Log References

- Story creation workflow execution trace (SM mode)
- Artifact analysis: sprint-status, epics, PRD, existing implementation docs

### Completion Notes List

- Ultimate context engine analysis completed - comprehensive developer guide created.
- Story prepared with implementation guardrails to prevent incorrect pathing, accessibility gaps, and non-semantic CTA behavior.

### File List

- `_bmad-output/implementation-artifacts/2-4-add-cv-pdf-download-button.md`

---

## Story Completion Status

- Story document created: yes
- Story status set to `ready-for-dev`: yes
- Sprint status synchronized: pending update in `sprint-status.yaml` (next step in workflow)
