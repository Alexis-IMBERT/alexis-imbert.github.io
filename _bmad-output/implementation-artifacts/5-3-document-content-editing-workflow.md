# Story 5.3: Document Content Editing Workflow

Status: review

<!-- Note: Validation is optional. Run validate-create-story for quality check before dev-story. -->
## Story

As a site owner,
I want documentation on how to edit existing content,
so that I can update publications, projects, or pages confidently.

## Acceptance Criteria

1. **Given** I need to update existing content
2. **When** I consult the documentation
3. **Then** I see instructions for modifying Markdown files
4. **And** I understand how to update frontmatter vs content
5. **And** I know how to preview changes locally before publishing

## Tasks / Subtasks

- [x] Task 1 (AC: 1, 2, 3) Document Markdown File Modification
  - [x] Identify common files to modify (e.g., `_pages`, `_publications`, `_projects`)
  - [x] Write clear instructions on opening and editing these files
- [x] Task 2 (AC: 1, 2, 4) Document Frontmatter vs. Content Updates
  - [x] Explain YAML frontmatter structure and fields
  - [x] Differentiate between editing metadata (frontmatter) and body text (Markdown/HTML)
- [x] Task 3 (AC: 1, 2, 5) Document Local Preview Steps
  - [x] Detail the commands to run Docker compose or local Ruby environment
  - [x] Explain how to view changes at `localhost:8080` (or appropriate port) before committing
- [x] Task 4 (AC: 1-5) Integrate Documentation
  - [x] Add the newly written sections to the `README.md` or a dedicated `docs/editing-content.md` file 
  - [x] Ensure formatting is clean, readable, and uses Markdown code blocks properly

## Dev Notes

- Relevant architecture patterns and constraints: This is purely documentation. Follow Markdown best practices. If placing in `README.md`, ensure logical flow and use proper headers.
- Source tree components to touch: `README.md` or `docs/editing-content.md` if establishing a docs folder.
- Testing standards summary: Documentation should be visually verified on GitHub or locally if using a markdown previewer to ensure links and formatting are correct.

### Project Structure Notes

- Keep documentation centralized. If a `docs` folder does not exist, consider adding the content directly into `README.md` under a recognizable "Content Management" or "Editing Guide" heading.

### References

- Reference standard Jekyll / al-folio theme structures for modifying collections (`_projects`, `_publications`).

## Dev Agent Record

### Agent Model Used

{{agent_model_name_version}}

### Debug Log References

### Completion Notes List
- Added `docs/editing-content.md` with instructions on editing content, YAML frontmatter vs body text, and previewing locally using Docker Compose.
- Verified all acceptance criteria are met for documenting content edits.

### File List
### File List
- `docs/editing-content.md`
- `_bmad-output/implementation-artifacts/5-3-document-content-editing-workflow.md`
- `_bmad-output/implementation-artifacts/sprint-status.yaml`
