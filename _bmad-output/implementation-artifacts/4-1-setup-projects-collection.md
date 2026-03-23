# Story 4.1: Setup Projects Collection

Status: ready-for-dev

<!-- Note: Validation is optional. Run validate-create-story for quality check before dev-story. -->

## Story

As a site owner,
I want a Jekyll collection configured for projects,
so that I can manage project content as structured Markdown files.

## Acceptance Criteria

1. **Given** the Jekyll site is configured
   **When** I create the `_projects` collection in `_config.yml`
   **Then** the collection is recognized by Jekyll
2. **And** a project layout template is created
3. **And** frontmatter schema is defined (title, description, technologies, github_url, demo_url, image)
4. **And** the collection is ready to receive project files

## Tasks / Subtasks

- [ ] Task 1: Update `_config.yml` (AC: 1, 4)
  - [ ] Add `_projects` to `collections:` in `_config.yml`, setting `output: true` so pages are generated
  - [ ] Add `_projects` to `defaults:` in `_config.yml` to automatically assign the `project` layout

- [ ] Task 2: Create a project layout template (AC: 2)
  - [ ] Create `_layouts/project.html`
  - [ ] Make it inherit from `page` or `default` layout and properly display content

- [ ] Task 3: Establish frontmatter schema (AC: 3, 4)
  - [ ] Create `_projects/_TEMPLATE.md` to define the baseline structure.
  - [ ] Include fields in frontmatter: `title`, `description`, `technologies`, `github_url`, `demo_url`, `image`

## Dev Notes

- Relevant architecture patterns and constraints: We are using the al-folio Jekyll theme. Al-folio may have a default `_projects` structure or layout. Please explore `al-folio` conventions in `_layouts` or `_includes` before creating from scratch.
- Source tree components to touch: `_config.yml`, `_layouts/project.html`, `_projects/` directory.
- Testing standards summary: Ensure that adding a basic Markdown file to `_projects/` causes Jekyll to successfully build and serve the file under the expected path (e.g., `/projects/<slug>`).

### Project Structure Notes

- Need to create `_projects/` root directory if not present.
- Needs to be aligned with existing collections like `_publications/`.

### References

- [Source: _bmad-output/planning-artifacts/epics.md#Epic-4-Projects-Showcase]

## Dev Agent Record

### Agent Model Used

Gemini 3.1 Pro (Preview)

### Debug Log References

- Configured `_config.yml` collection (already present).
- Added `_layouts/project.html`.
- Added `_projects/_TEMPLATE.md`.
- Ran `spec/projects_collection_ac_test.sh` resulting in all tests passing.

### Completion Notes List

- Addressed tasks 1, 2, and 3 successfully. Project collection is ready.

### File List
- `_config.yml`
- `_layouts/project.html`
- `_projects/_TEMPLATE.md`
