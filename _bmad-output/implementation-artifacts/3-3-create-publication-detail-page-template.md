# Story 3.3: Create Publication Detail Page Template

**Status:** in-progress  
**Epic:** 3 - Publications Hub  
**Story ID:** 3.3  
**Priority:** P0 - Core Publications Experience  
**Created:** 2026-03-22  
**Depends On:** Story 3.1 (publications collection), Story 3.2 (publications list page)

---

## Story

As a visitor (Thomas the researcher),
I want to access a detailed page for each publication,
so that I can view all information and resources for that publication.

---

## Acceptance Criteria

1. **Given** I click on a publication from the list  
   **When** the detail page loads  
   **Then** I see the full publication information (title, authors, venue, date, abstract)

2. **Given** I visit a publication detail page  
   **When** the page is rendered  
   **Then** it uses semantic HTML structure

3. **Given** I open a specific publication detail page  
   **When** I inspect the URL  
   **Then** it follows a unique URL pattern: `/publications/{slug}/`

4. **Given** I open a publication detail page  
   **When** metadata is generated  
   **Then** the page has proper meta tags for Google Scholar discoverability

---

## Tasks / Subtasks

- [ ] Strengthen the publication detail layout for complete metadata rendering (AC: 1, 2, 4)
  - [ ] Update `_layouts/publication.html` to render `title`, `authors`, `venue`, `date`, and `abstract` with semantic sections
  - [ ] Use semantic containers (`<article>`, `<header>`, `<section>`, `<dl>` or clear labeled blocks)
  - [ ] Keep `{{ content }}` rendering for long-form publication context
  - [ ] Keep conditional rendering for optional fields so pages remain robust with partial metadata

- [ ] Enforce unique publication URL behavior through collection configuration and content shape (AC: 3)
  - [ ] Confirm `_config.yml` keeps `collections.publications.output: true`
  - [ ] Confirm `_config.yml` keeps `collections.publications.permalink: /publications/:path/`
  - [ ] Ensure publication documents in `_publications/` use unique file names/slugs to prevent URL collisions

- [ ] Add Scholar-oriented metadata strategy in layout and/or includes (AC: 4)
  - [ ] Ensure standard page SEO metadata is provided via existing `jekyll-seo-tag` usage in the base layout
  - [ ] Add publication-specific citation meta tags in head rendering path (for example: `citation_title`, `citation_author`, `citation_publication_date`, `citation_pdf_url` when available)
  - [ ] Generate one `<meta name="citation_author">` per author when authors are provided as an array
  - [ ] Ensure metadata values are derived from publication front matter (single source of truth)

- [ ] Validate detail-page discoverability from publications list (AC: 1, 3)
  - [ ] Ensure each item in `publications.md` links to `{{ pub.url | relative_url }}`
  - [ ] Verify at least one publication fixture exists in `_publications/` during local testing to validate detail page generation

- [ ] Add acceptance/regression tests for publication detail template behavior (AC: 1, 2, 3, 4)
  - [ ] Add a shell acceptance test under `spec/` validating generated detail page exists at `/publications/{slug}/`
  - [ ] Assert detail page HTML contains title/authors/venue/date/abstract markers
  - [ ] Assert semantic structure markers are present in built output (`<article>`, heading hierarchy)
  - [ ] Assert key Scholar/SEO meta tags are present for the publication page

---

## Dev Notes

### Story Foundation

- This story implements FR7 and part of NFR9/NFR11 from planning artifacts.
- Existing repository already has a baseline publication layout in `_layouts/publication.html`, but it currently lacks explicit abstract handling and Scholar-specific metadata guidance.
- Existing configuration already supports collection output and permalink strategy needed for `/publications/{slug}/` URLs.

### Technical Requirements

- Maintain Jekyll-native implementation with Liquid templates.
- Treat publication front matter as authoritative source for all displayed fields and metadata.
- Support `authors` both as YAML array and as plain text fallback to avoid rendering breaks.
- Render publication date consistently (human-readable on page, machine-friendly in metadata).

### Architecture Compliance

- Respect current stack and conventions:
  - Jekyll + al-folio theme (`remote_theme: alshedivat/al-folio`)
  - Collections configured in `_config.yml`
  - Layouts under `_layouts/`
  - Content documents under `_publications/`
- Avoid introducing new build/deploy dependencies for this story.

### Library and Framework Requirements

- Reuse existing plugin stack already configured in `_config.yml`:
  - `jekyll-seo-tag`
  - `jekyll-sitemap`
  - `jekyll-feed`
  - `jekyll-paginate`
- Do not add new plugins unless implementation is impossible with existing stack.

### File Structure Requirements

- Primary files expected to change:
  - `_layouts/publication.html`
  - `_layouts/default.html` (only if metadata insertion point is required in `<head>`)
  - `_includes/` (optional metadata include for publication citation tags)
  - `spec/` acceptance tests for publication detail behavior
- Content fixtures for testing may be added under `_publications/`.

### Testing Requirements

- Validate with local build output (`_site/publications/.../index.html`) and existing test style in `spec/`.
- Include checks for:
  - Publication detail page generation per slug
  - Required visible fields (title/authors/venue/date/abstract)
  - Semantic structure presence
  - Citation metadata presence for scholar indexing support
- Keep tests resilient whether server is running or only static `_site` output is available.

### Previous Story Intelligence

- No Story 3.2 implementation artifact exists yet in `_bmad-output/implementation-artifacts/`; no prior Epic 3 dev learnings are available.
- Reuse stable implementation pattern from Epic 1 and Epic 2 artifacts: explicit AC-to-task traceability and shell-based acceptance checks in `spec/`.

### Git Intelligence Summary

Recent commits show a pattern of implementing stories with paired status tracking and acceptance checks:

- `dd2b38f` - Epic 2
- `90d1ca2` - CReate Story epic 2
- `28e36d1` - Retrospective Epic 1
- `f488a6a` - Stories 1.3 & 1.4
- `91c68f4` - 1-2-configure-docker-development-environment

Implementation for this story should follow the same discipline: explicit artifacts, test evidence, and status transitions.

### Latest Technical Information

- Jekyll collections require explicit `output: true` to generate collection document pages and allow linking through `document.url`.
- Jekyll SEO Tag supports site- and page-level metadata via `_config.yml` and front matter (`title`, `description`, `author`, `image`, `locale`).
- Google Scholar indexing guidance emphasizes one publication per unique URL and structured citation metadata in HTML meta tags (title, author, publication date; plus journal/conference fields when available). This directly impacts publication detail page head metadata requirements.

### Project Context Reference

- No `project-context.md` file detected; context derived from planning artifacts, current repository state, and latest docs references.

### References

- [Source: `_bmad-output/planning-artifacts/epics.md` (Story 3.3, FR7)]
- [Source: `_bmad-output/planning-artifacts/prd.md` (FR7, NFR9, NFR11, publication schema)]
- [Source: `_config.yml` (collections + plugins)]
- [Source: `publications.md` (list-to-detail linking behavior)]
- [Source: `_layouts/publication.html` (current baseline detail template)]
- [Source: Jekyll Collections docs - https://jekyllrb.com/docs/step-by-step/09-collections/]
- [Source: Jekyll SEO Tag usage - https://jekyll.github.io/jekyll-seo-tag/usage/]
- [Source: Google Scholar inclusion/indexing guidelines - https://scholar.google.com/intl/en/scholar/inclusion.html#indexing]

---

## Story Completion Status

- Story context document created with implementation guardrails, architecture alignment, metadata requirements, and anti-regression guidance.
- Story status set to `ready-for-dev`.
- Completion note: Ultimate context engine analysis completed - comprehensive developer guide created.

---

## Dev Agent Record

### Agent Model Used

GPT-5.3-Codex

### Debug Log References

- Story creation workflow context analysis completed.
- Sprint status updated for story key `3-3-create-publication-detail-page-template`.

### Completion Notes List

- This story was explicitly requested (`CS 3.3`) and generated directly instead of auto-selecting the first backlog story.
- Epic 3 remains `backlog` in sprint tracking because this is not story `3.1`; epic status transition should be handled when first epic story is actually started.

### File List

- `_bmad-output/implementation-artifacts/3-3-create-publication-detail-page-template.md`
- `_bmad-output/implementation-artifacts/sprint-status.yaml`
