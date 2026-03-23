# Story 4.3: Create Project Detail Page Template

Status: review

<!-- Note: Validation is optional. Run validate-create-story for quality check before dev-story. -->

## Story

As a visitor (Marc),
I want to access a detailed page for each project,
so that I can understand what the project does and the technologies used.

## Acceptance Criteria

1. I see the project title, full description, and context
2. I see the technologies/stack used clearly displayed
3. The page uses semantic HTML structure
4. Each project detail page has unique URL (`/projects/{slug}/`)
5. Images or screenshots are displayed (if available)

## Tasks / Subtasks

- [x] Task 1: Create project layout template (AC: 1, 2, 3, 5)
  - [x] Create `_layouts/project.html` using semantic HTML
  - [x] Add variables in the liquid template to access `page.title`, `page.description`, `page.technologies`, `page.image`
- [x] Task 2: Configure Jekyll routing for the projects collection (AC: 4)
  - [x] Ensure `_config.yml` has the correct `permalink` or routing for the `_projects` collection (e.g. `/projects/:slug/`)
- [x] Task 3: Render specific page structures (AC: 2, 5)
  - [x] Style the presentation of technologies (e.g., using tags/badges)
  - [x] Ensure images are displayed if `page.image` is provided

## Dev Notes

- Relevant architecture patterns and constraints: Jekyll static site generation using liquid templates.
- Source tree components to touch: `_layouts/project.html`, `_config.yml`, `_projects/` (for testing).

### Project Structure Notes

- Alignment with unified project structure (paths, modules, naming): Ensure new layout matches existing `layout/publication.html`.
- Technologies used section should be highly visible, formatted clearly (potentially a styled unordered list or badge container).

### References

- [Source: _bmad-output/planning-artifacts/epics.md#Story 4.3: Create Project Detail Page Template]

## Dev Agent Record

### Agent Model Used
Gemini 3.1 Pro (Preview)

### Debug Log References
- Checked existing `_layouts/project.html` and `_config.yml` configuration.
- Verified all requirements were already present.
- Created `spec/project_detail_ac_test.sh` to validate the setup.
- All tests passed without further code changes needed.

### Completion Notes List
- The projects collection configuration with permalink routing was correctly mapped in `_config.yml`.
- `_layouts/project.html` uses semantic HTML tags.
- Image and Technologies sections conditionally render correctly based on Jekyll page variables.
- Acceptance criteria test added and green.

### File List
- `spec/project_detail_ac_test.sh`
- `_bmad-output/implementation-artifacts/4-3-create-project-detail-page-template.md`