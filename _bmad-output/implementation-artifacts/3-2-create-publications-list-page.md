# Story 3.2: Create Publications List Page

**Status:** completed  
**Epic:** 3 - Publications Hub  
**Story ID:** 3.2  
**Priority:** P0 - Publications Discoverability  
**Created:** 2026-03-22  
**Depends On:** Story 3.1 (publications collection and base publication layout)

---

## Story

As a visitor (Sophie or Thomas),
I want to see a list of all publications,
so that I can browse Alexis's research output.

---

## Acceptance Criteria

1. **Given** I navigate to the Publications page  
   **When** the page loads  
   **Then** I see all publications listed in reverse chronological order

2. **Given** publications are displayed on the list page  
   **When** I inspect one publication item  
   **Then** I see title, authors, venue, and date

3. **Given** I want to read one publication in detail  
   **When** I click a publication in the list  
   **Then** I am redirected to its publication detail page

4. **Given** I navigate the website from any page  
   **When** I use the main navigation  
   **Then** the Publications page is reachable from the primary navigation

5. **Given** I load the Publications page  
   **When** metadata is rendered  
   **Then** SEO title and description tags are present and relevant

---

## Tasks / Subtasks

- [x] Implement complete publications listing output on `publications.md` (AC: 1, 2, 3)
  - [x] Replace current minimal output (`title` + optional `year`) with list items that render: title, authors, venue, date
  - [x] Keep reverse chronological behavior using `site.publications` sorted on publication date, with reverse ordering
  - [x] Ensure each item links to `pub.url | relative_url`
  - [x] Preserve graceful empty state when there are no publications

- [x] Validate publication metadata usage in list rendering (AC: 1, 2)
  - [x] Support `date` as canonical ordering/display field
  - [x] Keep backward-compatible fallback only if legacy `year` field exists
  - [x] Render authors cleanly whether provided as string or array

- [x] Ensure navigation discoverability and page semantics (AC: 4)
  - [x] Confirm `nav_menu` still contains a Publications entry targeting `/publications/`
  - [x] Keep page heading and semantic structure (list of publications) readable on mobile and desktop

- [x] Ensure SEO metadata presence on Publications page (AC: 5)
  - [x] Keep meaningful frontmatter values (`title`, `description`, `permalink`) in `publications.md`
  - [x] Verify theme/layout emits meta tags through existing `jekyll-seo-tag` integration

- [x] Add acceptance test coverage for Publications list behavior (AC: 1, 2, 3, 4, 5)
  - [x] Add shell acceptance test (for example `spec/publications_ac_test.sh`) to validate built page output
  - [x] Validate reverse chronological ordering by date in rendered HTML
  - [x] Validate required item fields appear for publication entries
  - [x] Validate item links point to publication detail URLs
  - [x] Validate Publications navigation link and basic meta tags exist

---

## Dev Notes

### Story Foundation

- This story implements Epic 3 / FR3 and FR6 directly, and establishes the browse entry point for later publication detail/resource stories (3.3, 3.4, 3.5).
- `publications.md` already exists and currently lists title + optional year only. Story 3.2 extends this to full publication summary fields and enforces robust chronological ordering.

### Technical Requirements

- Use Jekyll collection data source `site.publications`.
- Keep links relative-safe using `relative_url`.
- Ensure list ordering is based on publication date; reverse chronological means newest first.
- Maintain no-data fallback (`No publications published yet.` or equivalent).
- Do not introduce JavaScript dependency for this story.

### Architecture Compliance

- Existing architecture is static Jekyll + al-folio with collections configured in `_config.yml`:
  - `collections.publications.output: true`
  - `collections.publications.permalink: /publications/:path/`
- Keep implementation aligned with existing page-per-section pattern (`about.md`, `projects.md`, `contact.md`, `publications.md`).
- Reuse existing publication detail routing and layout (`_layouts/publication.html`) without changing URL contract.

### Library and Framework Requirements

- No new libraries required.
- Must remain compatible with current plugins in `_config.yml`:
  - `jekyll-seo-tag`
  - `jekyll-sitemap`
  - `jekyll-feed`
  - `jekyll-paginate`

### File Structure Requirements

- Primary file to update:
  - `publications.md`
- Likely test files to add/update:
  - `spec/publications_ac_test.sh` (new)
  - optional update to existing navigation/homepage checks if they already assert Publications behavior
- No expected changes to Docker, CI workflow, or collection config unless a concrete bug is found.

### Testing Requirements

- Validate rendered output on built site (`_site/publications/index.html`) and/or local server output.
- Add acceptance checks for:
  - reverse chronological ordering
  - required fields (title, authors, venue, date)
  - detail link presence
  - discoverability from main nav
  - SEO title/description/meta presence
- Run existing related regression tests (`spec/homepage_ac_test.sh`, and any publication-adjacent tests if present).

### Previous Story Intelligence

- No implementation artifact for Story 3.1 found in `_bmad-output/implementation-artifacts`.
- Collection-level setup appears already present in repository (`_config.yml` + `_layouts/publication.html` + `publications.md`), so this story should proceed by hardening list-page behavior without blocking on a missing artifact file.

### Git Intelligence Summary

Recent commit patterns show:

- Story-driven commits with sprint status synchronization are used.
- Acceptance behavior is typically validated through shell tests under `spec/`.
- Existing implementation has stable foundation from Epics 1 and 2; prefer minimal, focused edits per story.

### Latest Technical Information

- Jekyll collections are rendered and iterable through `site.<collection>` and detail URLs via document `url`.
- Reverse chronological collection display is conventionally achieved by sorting then applying `reverse`.
- Collection docs indicate date-based ordering semantics and recommend explicit frontmatter keys for predictable sorting behavior.

### Project Context Reference

- No `project-context.md` file detected.
- Context derived from:
  - PRD
  - Epics
  - Current repository implementation
  - Recent git history

### References

- [Source: `_bmad-output/planning-artifacts/epics.md` (Epic 3, Story 3.2, FR3/FR6)]
- [Source: `_bmad-output/planning-artifacts/prd.md` (Publications requirements, SEO/NFR)]
- [Source: `_config.yml` (collections + nav menu + SEO plugins)]
- [Source: `publications.md` (current list implementation)]
- [Source: `_layouts/publication.html` (existing detail page contract)]
- [Source: Jekyll Collections docs: https://jekyllrb.com/docs/collections/]
- [Source: Jekyll Liquid filters docs: https://jekyllrb.com/docs/liquid/filters/]

---

## Story Completion Status

- Story context document created with implementation guardrails, architecture alignment, and test expectations.
- Status set to `ready-for-dev`.
- Completion note: context includes anti-regression guidance for ordering, metadata rendering, navigation discoverability, and SEO tag presence.

---

## Dev Agent Record

### Agent Model Used

GPT-5.3-Codex

### Debug Log References

- Workflow execution for CS 3.2 with artifact analysis (epics, PRD, repo state, git history, Jekyll docs).

### Completion Notes List

- Created comprehensive story file for 3.2 directly in implementation artifacts.
- Included practical implementation guardrails grounded in current repository state.
- Included explicit testing plan aligned to existing shell acceptance testing approach.

### File List

- `_bmad-output/implementation-artifacts/3-2-create-publications-list-page.md`

### Change Log

- 2026-03-22: Initial story context creation for 3.2 with status `ready-for-dev`.
