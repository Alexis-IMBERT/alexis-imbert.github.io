# Story 3.1: Setup Publications Collection

**Status:** in-progress  
**Epic:** 3 - Publications Hub  
**Story ID:** 3.1  
**Priority:** P0 - Publications Foundation  
**Created:** 2026-03-22  
**Depends On:** Story 1.1 (Jekyll foundation)

---

## Story

As a site owner,
I want a Jekyll collection configured for publications,
so that I can manage publication content as structured Markdown files.

---

## Acceptance Criteria

1. **Given** the Jekyll site is configured  
   **When** I create the `_publications` collection in `_config.yml`  
   **Then** the collection is recognized by Jekyll

2. **Given** the publications collection is configured  
   **When** publication items are rendered  
   **Then** a publication layout template is available

3. **Given** publication content authoring begins  
   **When** a new publication markdown file is created  
   **Then** frontmatter schema is defined (`title`, `date`, `authors`, `venue`, `pdf`, `hal`, `doi`, `bibtex`, `slides`, `video`, `code`)

4. **Given** publication infrastructure is set up  
   **When** the owner prepares first publication entries  
   **Then** the collection is ready to receive publication files

---

## Story Requirements

### Functional Requirements

- Ensure collection key is `publications` in `_config.yml` with:
  - `output: true`
  - `permalink: /publications/:path/`
- Ensure default layout mapping exists for publication documents (`type: publications` -> `layout: publication`).
- Ensure publication layout file exists and is used by collection documents.
- Ensure publication frontmatter contract is explicitly defined and consistent with PRD schema.
- Ensure `_publications/` directory is present and ready for markdown entries.

### Non-Functional Requirements

- Keep implementation Jekyll-native (no extra plugins or runtime JS dependency).
- Preserve SEO and semantic HTML baseline from existing layout conventions.
- Keep authoring workflow simple: adding a publication should remain a lightweight markdown operation (NFR12).

### Scope Boundaries

- In scope: collection configuration, default mapping, publication layout availability, schema readiness.
- Out of scope: full publication listing behavior (Story 3.2), detailed resource rendering (Stories 3.3-3.5), content population migration.

---

## Developer Context

### Existing Implementation Intelligence

- `publications` collection is already present in `_config.yml` with output/permalink configured.
- Publication default layout mapping is already declared in `_config.yml` defaults.
- `_layouts/publication.html` already exists and renders title/authors/venue/date/content/pdf.
- `publications.md` already exists and lists `site.publications`.
- `_publications/` exists but is currently empty.

### Critical Guardrails (Do Not Reinvent)

- Do **not** introduce a new collection name (`papers`, `articles`, etc.); reuse `publications`.
- Do **not** move publication URLs away from `/publications/:path/`.
- Do **not** replace markdown-based authoring with data-file-only workflow for this story.
- Do **not** introduce custom build plugins for schema validation in this story.

### Known Consistency Risk to Handle in Epic 3

- Current list page sorts by `year`, while PRD schema defines `date` as canonical field.
- This story should establish schema clarity (`date` required), and Story 3.2 should ensure list sorting/output aligns with that canonical field.

---

## Technical Requirements

- Keep `collections.publications.output: true` in `_config.yml`.
- Keep `collections.publications.permalink: /publications/:path/` in `_config.yml`.
- Keep defaults scope for publication documents:
  - `type: "publications"`
  - `layout: "publication"`
- Frontmatter schema for publication files:
  - Required: `title`, `date`, `authors`, `venue`, `pdf`, `hal`, `doi`, `bibtex`
  - Optional: `slides`, `video`, `code`
- Maintain markdown body support for abstract/full description content.

---

## Architecture Compliance

- Respect existing Jekyll + al-folio architecture and directory conventions.
- Keep collection content under `_publications/` (exact naming required by Jekyll).
- Preserve current navigation path `/publications/` and collection detail route `/publications/{slug}/`.
- Keep implementation compatible with current plugin set in `_config.yml` and GitHub Pages style workflow.

---

## Library and Framework Requirements

- Jekyll collections behavior should follow current official guidance:
  - Collection directory must match configured collection label with leading underscore.
  - Collection documents need YAML frontmatter to be processed as documents.
  - `output: true` is required for generated detail pages.
- No new dependency is required for this story.

---

## File Structure Requirements

### Expected Files to Modify

- `_config.yml` (only if any missing collection/default fields are found)
- `_layouts/publication.html` (only if layout baseline is incomplete)
- `_publications/` (create starter publication or placeholder strategy only if needed)
- `spec/` (add acceptance checks for collection config readiness)

### Files That Must Not Be Changed Unnecessarily

- Deployment files (`.github/workflows/*`, `Dockerfile`, `docker-compose.yml`)
- Non-publication page content (`about.md`, `contact.md`, `projects.md`)

---

## Testing Requirements

### Manual Validation

- Confirm Jekyll build recognizes `site.publications` without errors.
- Confirm publication layout resolves for publication-type documents.
- Confirm `_publications/` authoring path is usable for new markdown entries.

### Automated Validation (Recommended)

- Add/update acceptance script (for example `spec/publications_collection_ac_test.sh`) to verify:
  - `collections.publications` exists with `output: true`.
  - Permalink pattern equals `/publications/:path/`.
  - Defaults map publication type to `publication` layout.
  - Publication layout file exists.

### Regression Checks

- Verify existing homepage/about/contact/project routes still build successfully.
- Verify no regressions introduced in navigation links.

---

## Previous Story Intelligence

- Story 3.1 is the first story in Epic 3; no prior same-epic implementation artifact exists.
- Reuse successful cross-epic pattern from Epic 2:
  - Keep implementation small and explicit.
  - Add acceptance tests in `spec/` aligned with AC wording.
  - Avoid broad refactors while establishing a new epic foundation.

---

## Git Intelligence Summary

Recent commit patterns show:

- Story progression uses dedicated implementation artifacts per story.
- Sprint tracking (`sprint-status.yaml`) is kept synchronized with story lifecycle.
- Acceptance verification is commonly captured in shell/RSpec scripts under `spec/`.
- Incremental, low-risk changes are preferred to large structural rewrites.

---

## Latest Technical Information

- Jekyll collections require exact directory naming (`_publications` for `publications`).
- Jekyll processes collection documents as content when YAML frontmatter is present.
- Collection detail pages are generated when `output: true` is set.
- Frontmatter defaults can reduce duplication and enforce consistent layout assignment.

---

## Project Context Reference

- No dedicated `project-context.md` detected.
- Story context derived from:
  - `_bmad-output/planning-artifacts/epics.md`
  - `_bmad-output/planning-artifacts/prd.md`
  - `_config.yml`
  - `publications.md`
  - `_layouts/publication.html`
  - recent git history

---

## Tasks / Subtasks

- [ ] Verify and complete publications collection configuration (AC: 1)
  - [ ] Confirm `collections.publications.output` is `true`
  - [ ] Confirm `collections.publications.permalink` is `/publications/:path/`
- [ ] Verify publication layout baseline (AC: 2)
  - [ ] Confirm `_layouts/publication.html` exists and is applied by defaults
  - [ ] Ensure template supports core metadata rendering (`title`, `authors`, `venue`, `date`)
- [ ] Establish and document publication frontmatter schema contract (AC: 3)
  - [ ] Ensure required/optional fields are explicit and aligned with PRD
  - [ ] Ensure future publication files can follow one canonical schema
- [ ] Ensure collection is operational for first content entries (AC: 4)
  - [ ] Confirm `_publications/` path is present and usable
  - [ ] Validate build passes with collection configuration intact
- [ ] Add readiness/regression checks in `spec/` (AC: 1, 2, 3, 4)

---

## Dev Notes

- Keep this story foundational and deterministic; avoid implementing list/detail feature behavior reserved for next stories.
- Preserve compatibility with current Jekyll configuration and deployment workflow.
- If introducing a sample publication file to validate schema, keep it minimal and non-disruptive.

### References

- Source: `_bmad-output/planning-artifacts/epics.md` (Epic 3, Story 3.1)
- Source: `_bmad-output/planning-artifacts/prd.md` (Publication schema, FR6-FR14, NFR11, NFR12)
- Source: `_config.yml` (collections/defaults)
- Source: `publications.md` (list page baseline)
- Source: `_layouts/publication.html` (detail layout baseline)
- Source: Jekyll docs (`collections`, `front-matter`)

---

## Dev Agent Record

### Agent Model Used

GPT-5.3-Codex

### Debug Log References

- Story creation workflow execution for CS 3.1.
- Artifact analysis: sprint status, epics, PRD, repository configuration, and recent commits.

### Completion Notes List

- Ultimate context engine analysis completed - comprehensive developer guide created.
- Story prepared with anti-reinvention guardrails and schema consistency notes for Epic 3 implementation.
- Story intentionally kept in `ready-for-dev` state for developer execution.

### File List

- `_bmad-output/implementation-artifacts/3-1-setup-publications-collection.md`
- `_bmad-output/implementation-artifacts/sprint-status.yaml`

---

## Story Completion Status

- Story context document created: yes
- Story status set to `ready-for-dev`: yes
- Sprint status synchronized in `sprint-status.yaml`: yes
