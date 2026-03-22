# Story 2.3: Add External Profile Links

Status: done

## Story

As a visitor,
I want to access Alexis's external profiles (ORCID, ResearchGate, Google Scholar, GitHub, LinkedIn),
so that I can explore more about his work on other platforms.

## Acceptance Criteria

1. **Given** I am on the About/CV page or homepage  
   **When** I look for external profile links  
   **Then** I see clickable icons/links for: ORCID, ResearchGate, Google Scholar, GitHub, LinkedIn.

2. **Given** I click an external profile link  
   **When** the target opens  
   **Then** it opens in a new tab.

3. **Given** I use assistive technology  
   **When** I navigate profile links  
   **Then** each icon/link has descriptive accessibility text.

## Tasks / Subtasks

- [x] Create a single reusable profile-links include (AC: 1, 2, 3)
  - [x] Add `_includes/external-profiles.html` to avoid duplicated markup across pages.
  - [x] Render the five required providers in a stable order: ORCID, ResearchGate, Google Scholar, GitHub, LinkedIn.
  - [x] Ensure each anchor uses `target="_blank"` and `rel="noopener noreferrer"`.
  - [x] Ensure each link has accessible text (`aria-label`) and/or visible link text.

- [x] Configure profile identifiers/URLs in site configuration (AC: 1)
  - [x] Keep `github_username` and `linkedin_username` from `_config.yml` as source of truth.
  - [x] Add/complete config keys for ORCID, ResearchGate, and Google Scholar profile IDs/URLs.
  - [x] Implement graceful fallback: do not render a provider when its config is empty.

- [x] Integrate links into current user-visible entry point (AC: 1)
  - [x] Add include call to `index.md` in the "Let's Connect" section.
  - [x] Keep integration compatible with future About/CV page from Story 2.1 (same include can be reused).

- [x] Add/extend acceptance checks (AC: 1, 2, 3)
  - [x] Extend `spec/homepage_ac_test.sh` to verify five providers are present when configured.
  - [x] Verify generated HTML includes `target="_blank"`, `rel="noopener noreferrer"`, and descriptive labels.
  - [x] Keep scripts macOS-compatible (portable `grep`/`sed`; avoid GNU-only flags).

## Dev Notes

- This repository currently uses custom templates in `_layouts/default.html` and `_includes/header.html`, while `remote_theme: alshedivat/al-folio` remains enabled. Keep this story scoped to profile links only and avoid broad layout rewrites. [Source: _layouts/default.html, _includes/header.html]
- Existing homepage already includes GitHub and LinkedIn as plain markdown links. Replace with a reusable include rather than adding more hardcoded links. [Source: index.md]
- `_data/cv.yml` currently contains only whitespace, so data-driven rendering from CV data is not yet available. Prefer site config keys for this story.

### Technical Requirements

- Use Liquid templating in `_includes/external-profiles.html`.
- Normalize provider URL construction:
  - ORCID: `https://orcid.org/<id>`
  - ResearchGate: `https://www.researchgate.net/profile/<id-or-slug>` (or explicit full URL key)
  - Google Scholar: `https://scholar.google.com/citations?user=<id>` (or explicit full URL key)
  - GitHub: `https://github.com/<username>`
  - LinkedIn: `https://www.linkedin.com/in/<username>`
- Security for new-tab links is mandatory: `rel="noopener noreferrer"`.
- Accessibility is mandatory:
  - Use clear labels such as `aria-label="Alexis Imbert on ORCID"`.
  - If icons are used, include text alternatives and avoid icon-only inaccessible links.

### Architecture Compliance

- Preserve current project organization and naming conventions:
  - Reusable include in `_includes/`
  - Config keys in `_config.yml`
  - Content usage in `index.md`
- Do not introduce JS dependencies for this story.
- Do not modify deployment workflow or Docker setup.

### Library / Framework Requirements

- Keep implementation within Jekyll/Liquid and existing plugin set.
- `jekyll-seo-tag` is already active; this story should not change SEO plugin behavior, only outbound profile links in page content. [Source: _config.yml]
- al-folio compatibility required: avoid template assumptions that conflict with theme updates.

### File Structure Requirements

- Expected touch points:
  - `_includes/external-profiles.html` (new)
  - `_config.yml` (social profile IDs/keys)
  - `index.md` (replace hardcoded profile list with include)
  - `spec/homepage_ac_test.sh` (acceptance checks)
- Optional future touch point:
  - About/CV page file when Story 2.1 is implemented (reuse the same include).

### Testing Requirements

- Local validation path:
  - `docker compose up` for preview.
  - Run `spec/homepage_ac_test.sh` and ensure checks pass for profile links.
- Expected checks:
  - All five providers are rendered when corresponding config values exist.
  - Each rendered link opens in a new tab and includes `rel="noopener noreferrer"`.
  - Labels are descriptive for accessibility.
  - Missing config values hide only the corresponding provider without breaking others.

### Previous Story Intelligence

- No Story 2.2 implementation artifact exists yet in `_bmad-output/implementation-artifacts`, so there are no Epic 2 carry-over dev learnings to reuse.
- Apply known repo lesson: keep shell checks portable on macOS (no GNU-only flags).

### Git Intelligence Summary

Recent commit patterns indicate:
- Story workflows consistently update `_bmad-output/implementation-artifacts/<story>.md` and `_bmad-output/implementation-artifacts/sprint-status.yaml`.
- UI-related changes in prior stories touched `_config.yml`, `index.md`, `_includes/`, `_layouts/`, and shell specs in `spec/`.
- Keep this story aligned with those patterns and minimize cross-cutting edits.

### Latest Technical Information

- Jekyll docs confirm standard structure for includes/layouts and configuration-driven content in static pages. [Source: https://jekyllrb.com/docs/]
- Jekyll SEO Tag generates metadata (title/description/Open Graph/Twitter/JSON-LD), but does not replace content-level accessibility and link hygiene requirements. [Source: https://jekyll.github.io/jekyll-seo-tag/]
- al-folio latest release appears as `v0.16.3`; story changes should remain theme-friendly and avoid hard-coding that would block future theme sync. [Source: https://github.com/alshedivat/al-folio/releases]

### Project Structure Notes

- Unified structure alignment:
  - Content pages in root markdown files
  - Shared components under `_includes`
  - Site settings in `_config.yml`
  - Validation scripts under `spec/`
- No structural conflict detected for this story.

### References

- _bmad-output/planning-artifacts/epics.md (Epic 2, Story 2.3)
- _bmad-output/planning-artifacts/prd.md (FR22, NFR6/NFR7/NFR8)
- _config.yml (social links + plugin configuration)
- index.md (current "Let's Connect" implementation)
- _layouts/default.html (render path and style baseline)
- _includes/header.html (navigation and include conventions)
- _bmad-output/implementation-artifacts/sprint-status.yaml (story tracking)
- https://jekyllrb.com/docs/
- https://jekyll.github.io/jekyll-seo-tag/
- https://github.com/alshedivat/al-folio/releases

## Dev Agent Record

### Agent Model Used

GPT-5.3-Codex

### Debug Log References

- create-story workflow context assembly completed
- sprint status updated to ready-for-dev for this story
- code-review identified AC/documentation/test gaps and they were fixed in-place

### Completion Notes List

- Ultimate context engine analysis completed - comprehensive developer guide created.
- Added profile links include to About/CV to satisfy AC1 coverage on About or homepage.
- Added explicit URL support for ResearchGate and Google Scholar with fallback to profile/user ID keys.
- Extended acceptance checks to validate fallback logic and fail fast when local preview is unavailable.

### File List

- _bmad-output/implementation-artifacts/2-3-add-external-profile-links.md
- _includes/external-profiles.html
- _config.yml
- index.md
- about.md
- spec/homepage_ac_test.sh
