# Story 3.4: Add Publication Resources (PDF, HAL, DOI, BibTeX)

Status: ready-for-dev

## Story

As a visitor (Thomas or Sophie),
I want to access the publication PDF, HAL link, DOI, and BibTeX citation,
so that I can read and cite the paper.

## Acceptance Criteria

1. Given I am on a publication detail page
   When the resources section loads
   Then I see a "Download PDF" button that downloads the paper PDF
2. Given I am on a publication detail page
   When HAL is available for this publication
   Then I see a clickable HAL link
3. Given I am on a publication detail page
   When DOI is available for this publication
   Then I see the DOI displayed with a clickable DOI link
4. Given I am on a publication detail page
   When BibTeX is available for this publication
   Then I see a "Copy BibTeX" action or an expandable BibTeX section
5. Given I click the BibTeX action
   When the interaction completes
   Then the citation is copied to clipboard or clearly displayed for copy
6. Given BibTeX is displayed or copied
   When rendered
   Then formatting remains valid and readable
7. Given one or more resources are missing
   When the page renders
   Then missing resources are gracefully hidden (no broken links/placeholders)

## Tasks / Subtasks

- [ ] Implement publication resources section in publication layout (AC: 1, 2, 3, 4, 7)
  - [ ] Extend `_layouts/publication.html` to render a dedicated resources block
  - [ ] Keep conditional rendering per field (`pdf`, `hal`, `doi`, `bibtex`)
  - [ ] Keep existing metadata rendering (title/authors/venue/date/content) intact
- [ ] Implement DOI and HAL link rendering rules (AC: 2, 3, 7)
  - [ ] HAL: render only when `page.hal` exists and is non-empty
  - [ ] DOI: support either raw DOI (`10.x/...`) or full URL; normalize to `https://doi.org/<doi>` when needed
  - [ ] Add `target="_blank"` and `rel="noopener noreferrer"` for external links
- [ ] Implement BibTeX interaction pattern (AC: 4, 5, 6)
  - [ ] Preferred: add a progressive-enhancement copy button + fallback `<pre><code>` display
  - [ ] Ensure feature still works when JS is unavailable (fallback visible text)
  - [ ] Escape BibTeX content safely to prevent broken HTML
- [ ] Preserve graceful degradation and accessibility (AC: 1, 7)
  - [ ] Use semantic labels/headings for the resources section
  - [ ] Ensure keyboard-accessible controls and visible focus states
  - [ ] Avoid empty wrappers when resources are absent
- [ ] Add verification coverage for publication resources (AC: 1-7)
  - [ ] Add shell acceptance test (e.g., `spec/publication_resources_ac_test.sh`) validating rendered output for present/missing resources
  - [ ] Add at least one fixture publication under `_publications/` for test execution
  - [ ] Confirm no regressions for existing publication detail rendering

## Dev Notes

### Story Requirements

- Epic source defines Story 3.4 as resource enrichment of publication detail pages, following Story 3.3 template creation.
- Functional scope targets four core fields: PDF, HAL, DOI, BibTeX.
- Optional-resource handling is mandatory: no broken or empty UI.

### Existing Code Intelligence

- `_layouts/publication.html` already renders publication metadata and a basic PDF link gated by `page.pdf`.
- No publication files currently exist in `_publications/`, so implementation should include at least one realistic example entry to validate behavior.
- `publications.md` already links each publication to detail pages through collection URLs.

### Technical Requirements

- Keep implementation within existing Jekyll/Liquid stack, no new runtime frameworks.
- Use Liquid conditionals for all resource visibility logic.
- For DOI normalization:
  - If value starts with `http://` or `https://`, use as-is.
  - Else prefix with `https://doi.org/`.
- BibTeX field can be multiline YAML (`|` block); preserve newlines in output.
- If JS is used for clipboard copy, keep it minimal and local to layout/page (no new build tooling).

### Architecture Compliance

- Respect collection configuration in `_config.yml`:
  - `collections.publications.output: true`
  - publication permalink pattern `/publications/:path/`
  - default layout for publications is `publication`
- Keep rendering inside `_layouts/publication.html` to preserve architectural separation (content in `_publications/*.md`, presentation in layout).
- Maintain semantic HTML and SEO friendliness from existing structure.

### Library and Framework Requirements

- Jekyll + Liquid only for templating and conditional UI.
- Native browser Clipboard API is optional enhancement, not a hard dependency.
- No external JS/CSS library should be introduced for this story.

### File Structure Requirements

- Primary file to update:
  - `_layouts/publication.html`
- Likely files to add/update for validation and examples:
  - `_publications/<sample-publication>.md`
  - `spec/publication_resources_ac_test.sh`
- Avoid unrelated modifications to:
  - deployment workflow files
  - Docker configuration
  - navigation/header files

### Testing Requirements

- Validate both positive and negative states:
  - Publication with all resources shows PDF/HAL/DOI/BibTeX controls
  - Publication with partial resources hides missing entries cleanly
- Verify DOI link format and HAL link target integrity.
- Verify BibTeX is readable and copy/display path works.
- Verify detail page remains accessible and structurally valid after changes.

### Previous Story Intelligence

- Story 3.3 implementation artifact is not yet present in `_bmad-output/implementation-artifacts`.
- Since publication layout exists, treat current state as baseline and keep changes incremental to avoid regressions.

### Git Intelligence Summary

Recent commits indicate the team pattern is:
- Deliver story-scoped changes with synchronized status updates.
- Use `spec/*.sh` acceptance checks to lock expected HTML behavior.
- Keep modifications incremental and aligned to existing file organization.

### Latest Technical Information

- HTML anchor `download` behavior is browser-dependent for cross-origin files; here resources should remain same-origin when possible for predictable download behavior.
- Clipboard API may require secure context and can fail silently depending on browser permissions; fallback display of BibTeX text is required.
- External links should use `rel="noopener noreferrer"` with `target="_blank"` for security hygiene.

### Project Context Reference

- No `project-context.md` file found in workspace.
- Story context derived from:
  - `_bmad-output/planning-artifacts/epics.md`
  - `_bmad-output/planning-artifacts/prd.md`
  - `_config.yml`
  - `_layouts/publication.html`
  - `publications.md`
  - recent git history

### References

- Source: `_bmad-output/planning-artifacts/epics.md` (Epic 3, Story 3.4)
- Source: `_bmad-output/planning-artifacts/prd.md` (FR8, FR9, FR10, FR11, NFR6, NFR8, NFR11)
- Source: `_layouts/publication.html` (current publication detail template)
- Source: `_config.yml` (publications collection and layout defaults)
- Source: `publications.md` (publications list linking behavior)
- Source: `git log -n 5` (recent implementation patterns)

## Story Completion Status

- Ultimate context engine analysis completed - comprehensive developer guide created.
- Story status set to `ready-for-dev`.
- Story file created in implementation artifacts for direct handoff to dev workflow.

## Dev Agent Record

### Agent Model Used

GPT-5.3-Codex

### Debug Log References

- Story creation workflow execution (CS with explicit story target 3.4)
- Artifact analysis on sprint tracking, epics, PRD, current layout, and git history

### Completion Notes List

- Target story resolved from user input: `3.4` -> `3-4-add-publication-resources-pdf-hal-doi-bibtex`.
- Guardrails added to prevent common LLM implementation failures:
  - wrong link normalization for DOI
  - broken behavior when optional fields are absent
  - over-reliance on JS for BibTeX copy
- Test strategy includes both full-resource and partial-resource publication cases.

### File List

- `_bmad-output/implementation-artifacts/3-4-add-publication-resources-pdf-hal-doi-bibtex.md`
