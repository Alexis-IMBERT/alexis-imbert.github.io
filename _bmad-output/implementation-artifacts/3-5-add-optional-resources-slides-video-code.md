# Story 3.5: Add Optional Resources (Slides, Video, Code)

**Status:** in-progress  
**Epic:** 3 - Publications Hub  
**Story ID:** 3.5  
**Priority:** P0 - Research Resource Completeness  
**Created:** 2026-03-22  
**Depends On:** Story 3.3 (publication detail template), Story 3.4 (core resources rendering)

---

## Story

As a visitor (Thomas),
I want to access presentation slides, video, and code repository for a publication,
so that I can fully understand and reproduce the research.

---

## Acceptance Criteria

1. **Given** I am on a publication detail page  
   **When** optional resources are available  
   **Then** I see a "View Slides" link (if slides exist)

2. **Given** I am on a publication detail page  
   **When** optional resources are available  
   **Then** I see a "Watch Presentation" link (if video exists)

3. **Given** I am on a publication detail page  
   **When** optional resources are available  
   **Then** I see a "View Code" (or GitHub) link (if repository exists)

4. **Given** I click optional resource links  
   **When** the link opens  
   **Then** it opens in a new tab

5. **Given** any optional resource is missing in front matter  
   **When** the page renders  
   **Then** the missing resource is not displayed

---

## Tasks / Subtasks

- [ ] Extend publication detail layout for optional resources (AC: 1, 2, 3, 5)
  - [ ] Update `_layouts/publication.html` to conditionally render slides, video, and code links
  - [ ] Use `page.slides`, `page.video`, and `page.code` as conditional guards
  - [ ] Keep output clean when fields are absent (no empty labels/containers)

- [ ] Ensure safe new-tab behavior for external resources (AC: 4)
  - [ ] Add `target="_blank"` on optional resource links
  - [ ] Add `rel="noopener noreferrer"` for security
  - [ ] Preserve existing internal-link behavior for non-external links

- [ ] Keep publication resource area coherent with existing PDF/HAL/DOI/BibTeX behavior (AC: 1, 2, 3, 5)
  - [ ] Preserve backward compatibility with stories 3.3/3.4 expectations
  - [ ] Avoid regressions on existing `page.pdf` conditional rendering

- [ ] Add acceptance test coverage for optional resources and hidden-missing behavior (AC: 1, 2, 3, 4, 5)
  - [ ] Add a story-specific shell acceptance test under `spec/` (for example `spec/publication_optional_resources_ac_test.sh`)
  - [ ] Validate optional links appear only when corresponding front matter exists
  - [ ] Validate rendered optional links include `_blank` and `rel="noopener noreferrer"`
  - [ ] Validate no broken optional placeholders are rendered when fields are missing

---

## Dev Notes

### Story Foundation

- This story implements Epic 3 Story 3.5 from planning artifacts and closes FR12, FR13, and FR14.
- The current publication detail template exists in `_layouts/publication.html` and currently only renders a conditional PDF link.
- Optional resources must be additive and non-breaking for existing publication pages.

### Technical Requirements

- Implement using Jekyll/Liquid conditionals only; do not add JavaScript dependencies.
- Use simple, explicit conditional blocks:
  - `if page.slides` => render "View Slides"
  - `if page.video` => render "Watch Presentation"
  - `if page.code` => render "View Code"
- Keep labels human-readable and consistent with acceptance criteria.
- Optional links should open in a new tab and include secure rel attributes.

### Architecture Compliance

- Stack constraints to respect:
  - Jekyll static site
  - al-folio-based theme via `remote_theme`
  - Markdown content + YAML front matter in collections
- Collection and permalink behavior is already configured in `_config.yml` for `publications`.
- Story scope should remain in publication rendering; avoid unrelated edits in navigation, deployment, or Docker setup.

### Library and Framework Requirements

- No new library or plugin should be introduced.
- Use existing Liquid templating and current layout system.
- Keep compatibility with configured plugins: `jekyll-feed`, `jekyll-seo-tag`, `jekyll-sitemap`, `jekyll-paginate`.

### File Structure Requirements

- Primary files expected:
  - `_layouts/publication.html` (main implementation)
  - `spec/publication_optional_resources_ac_test.sh` (new acceptance checks)
- Optional fixture content for tests (only if required for deterministic validation):
  - one publication fixture with all optional fields
  - one publication fixture with missing optional fields
- Avoid introducing broad CSS refactors; keep story impact focused.

### Testing Requirements

- Add/adjust tests in project shell-script style used in `spec/`.
- Minimum validations:
  - resource link appears when field exists
  - resource link absent when field missing
  - links open new tab with secure rel attributes
  - legacy PDF behavior still intact
- If local runtime checks are executed, use existing local build flow (`docker-compose up --build` or Jekyll build flow) and point tests to `_site` output.

### Previous Story Intelligence

- No implementation artifact exists yet for Story 3.4 in `_bmad-output/implementation-artifacts`, so direct previous-story learnings are unavailable.
- Reuse proven approach from prior completed stories:
  - explicit AC-to-test mapping
  - story-specific shell AC scripts
  - no broad-scope refactors in a single story

### Git Intelligence Summary

Recent commit patterns indicate:

- Story-driven commits with synchronized sprint-status updates.
- Quality checks rely on `spec/` scripts and concrete executable evidence.
- Existing implementation cadence favors incremental, test-backed changes.

Most recent commits reviewed:

- `dd2b38f` Epic 2
- `90d1ca2` CReate Story epic 2
- `28e36d1` Retrospective Epic 1
- `f488a6a` Stories 1.3 & 1.4
- `91c68f4` 1-2-configure-docker-development-environment

### Latest Technical Information

- For links opening new tabs, modern security guidance remains to pair `target="_blank"` with `rel="noopener noreferrer"`.
- Liquid conditionals with optional front matter fields are the standard Jekyll pattern for graceful rendering of absent metadata.
- Keep output semantic and simple to preserve SEO/accessibility behavior established in prior stories.

### Project Context Reference

- No `project-context.md` file detected in repository.
- Story context derived from:
  - `_bmad-output/planning-artifacts/epics.md`
  - `_bmad-output/planning-artifacts/prd.md`
  - `_config.yml`
  - `_layouts/publication.html`
  - sprint tracking and commit history

### References

- [Source: _bmad-output/planning-artifacts/epics.md (Epic 3, Story 3.5; FR12/FR13/FR14)]
- [Source: _bmad-output/planning-artifacts/prd.md (Journey 3, publication resource schema)]
- [Source: _config.yml (collections.publications, defaults.layout)]
- [Source: _layouts/publication.html (current publication detail rendering)]
- [Source: _bmad-output/implementation-artifacts/sprint-status.yaml (story tracking state)]
- [Source: git history (last 5 commits)]

---

## Story Completion Status

- Story context document created with implementation guardrails, architecture alignment, test expectations, and anti-regression requirements.
- Story status set to `ready-for-dev`.
- Completion note: Ultimate context engine analysis completed - comprehensive developer guide created.

---

## Dev Agent Record

### Agent Model Used

GPT-5.3-Codex

### Debug Log References

- Create-story context generation completed for story 3.5.

### Completion Notes List

- Story key resolved from sprint tracking: `3-5-add-optional-resources-slides-video-code`.
- Scope focused on publication detail rendering and acceptance-test guardrails.
- Previous Epic 3 implementation artifact dependency (3.4) not yet present; requirements derived from planning artifacts and current template state.

### File List

- `_bmad-output/implementation-artifacts/3-5-add-optional-resources-slides-video-code.md`
