# Story 5.5: Create README with Project Overview

Status: done

<!-- Note: Validation is optional. Run validate-create-story for quality check before dev-story. -->

## Story

As a new contributor or site owner,
I want a comprehensive README,
so that I understand the project structure and how to work with it.

## Acceptance Criteria

1. **Given** I open the repository
   **When** I read the README.md
   **Then** I see the project description and purpose
2. **And** I see local development setup instructions (using Docker and Docker Compose)
3. **And** I see links to content management documentation (how to add publications, projects, etc.)
4. **And** I see deployment information detailing the GitHub Pages workflow via GitHub Actions
5. **And** the code structure of the repository (Jekyll collections, data files) is explained

## Tasks / Subtasks

- [x] Task 1: Initialize/Update `README.md` at project root (AC: #1, #5)
  - [x] Subtask 1.1: Add introduction, project purpose, and owner description.
  - [x] Subtask 1.2: Add a section explaining project layout and Jekyll structure (e.g. `_publications/`, `_projects/`, `_data/`).
- [x] Task 2: Document development and deployment workflows (AC: #2, #4)
  - [x] Subtask 2.1: Add step-by-step instructions for running the site locally using Docker (`docker-compose up`).
  - [x] Subtask 2.2: Add a section detailing automatic deployment using GitHub Actions to GitHub Pages.
- [x] Task 3: Add links to content management documentation (AC: #3)
  - [x] Subtask 3.1: Provide links within the README to the markdown instructions created in stories 5.1, 5.2, and 5.3 (or explain how to edit markdown files in the repository).

## Dev Notes

- **Relevant architecture patterns and constraints**: This story does not require coding functionality, but strictly documentation gathering. Ensure markdown syntax is clean (valid Markdown). 
- **Source tree components to touch**:
  - `/README.md` (Update the root readme file)
- **Code structure specifics**: The project uses an `al-folio` base structure, `_publications`, `_projects`, `_data`, etc. Reference these correctly.

### Project Structure Notes

- **Alignment with unified project structure**: Ensure the README accurately reflects the current structure of the workspace, mentioning standard directories created throughout the epic.

### References

- [Source: epics.md#Story-5.5]

## Dev Agent Record

### Agent Model Used

Gemini 3.1 Pro (Preview)

### Debug Log References

N/A

### Completion Notes List

- Updated `README.md` with:
  - Project intro and purpose.
  - Explanation of Jekyll structure (`_publications`, `_projects`, `_data`).
  - Replaced unstable/internal documentation links with stable onboarding references (`_publications/_TEMPLATE.md`, `_projects/_TEMPLATE.md`, `docs/editing-content.md`).
  - Verified Docker compose local dev setup instructions are present.
  - Verified GitHub actions automated deployment description is present.
- Added dedicated acceptance test `spec/readme_overview_ac_test.sh` to validate all Story 5.5 ACs directly from `README.md`.
- Review auto-fix completed for HIGH/MEDIUM findings raised during CR 5.5.

### File List
- README.md
- spec/readme_overview_ac_test.sh
- _bmad-output/implementation-artifacts/5-5-create-readme-with-project-overview.md
- _bmad-output/implementation-artifacts/sprint-status.yaml

## Senior Developer Review (AI)

### Review Date

2026-03-25

### Outcome

- Applied automatic fixes for all identified HIGH and MEDIUM issues for Story 5.5.
- README content-management references now point to stable, contributor-facing files in the repository.
- Added a story-specific acceptance test script to cover AC #1 to #5.
- Story status moved from `review` to `done`.

### Git Branch Context

- Branch contains parallel changes outside Story 5.5 scope.
- Story 5.5 File List above records only files touched during this review/fix cycle.

### Change Log

- 2026-03-25: CR 5.5 auto-fix applied (README hardening + AC test coverage + status sync).
