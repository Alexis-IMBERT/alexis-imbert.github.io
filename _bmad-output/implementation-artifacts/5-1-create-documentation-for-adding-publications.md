# Story 5.1: Create Documentation for Adding Publications

Status: done

## Story

As a site owner,
I want clear documentation on how to add a new publication,
so that I can add content quickly without confusion.

## Acceptance Criteria

1. Given I want to add a new publication, When I read the documentation (e.g., in a `docs/` folder or `README`), Then I see step-by-step instructions for creating a publication file.
2. Given I want to add a new publication, When I read the documentation, Then I see the required frontmatter fields explained.
3. Given I want to add a new publication, When I read the documentation, Then I see an example publication file.
4. Given I want to add a new publication, When using the documentation, Then adding a publication takes no more than 10 minutes (NFR12).

## Tasks / Subtasks

- [x] Task 1: Create Content Management Documentation for Publications (AC: 1, 2)
  - [x] Create a documentation file (e.g., `docs/adding-publications.md` or `CONTENT_MANAGEMENT.md`).
  - [x] Write step-by-step instructions on duplicating `_publications/_TEMPLATE.md` to create a new publication.
  - [x] Explain all frontmatter fields (`title`, `date`, `authors`, `venue`, `pdf`, `hal`, `doi`, `bibtex`, `slides`, `video`, `code`), identifying which are required versus optional.
- [x] Task 2: Provide an Example (AC: 3)
  - [x] Include an example frontmatter configuration within the documentation to show what a complete file looks like.
- [x] Task 3: Template File Polish (AC: 1, 2, 4)
  - [x] Ensure that `_publications/_TEMPLATE.md` exists and is up to date with comments for easy duplication. (It already exists, but verify it aligns perfectly with the documentation.)

## Dev Notes

- The project uses Jekyll with a custom `_publications` collection.
- `_publications/_TEMPLATE.md` already exists and contains the necessary schema comments. We can document that the owner simply needs to duplicate this file, rename it (e.g., `YYYY-MM-DD-title.md` or `slug.md`), and fill in the values.
- No need to reinvent the wheel: just reference the existing template and provide clear markdown instructions.
- We have an overarching requirement (FR25) to allow adding publications simply via markdown.

### Project Structure Notes

- A `docs/` folder can be created to hold content management instructions, or you could add a `CONTENT_GUI.md` / `wiki` file in the root. A dedicated `docs/content-management.md` is a clean way to start capturing these instructions.

### References

- [Source: _bmad-output/planning-artifacts/epics.md#story-51-create-documentation-for-adding-publications]
- [Source: _bmad-output/planning-artifacts/prd.md] (NFR12, FR25)

## Dev Agent Record

### Agent Model Used

GPT-5.3-Codex


### Debug Log References

- `bash spec/adding_publications_ac_test.sh` (pass)
- `bash spec/content_management_projects_ac_test.sh` (fail, unrelated existing issue in Story 5.2: `assets/images/` vs expected `assets/img/`)

### Completion Notes List

- Updated `docs/adding-publications.md` with a clear 10-minute quick path to satisfy NFR12.
- Removed unsupported `demo` field from publication documentation and example to match publication layout behavior.
- Aligned `_publications/_TEMPLATE.md` with the guide by using YAML list format for `authors`.
- Added acceptance test `spec/adding_publications_ac_test.sh` to validate AC1-AC4 coverage for Story 5.1.
- Performed automatic review fixes for all identified HIGH/MEDIUM issues scoped to Story 5.1.

### File List

- `docs/adding-publications.md`
- `_publications/_TEMPLATE.md`
- `spec/adding_publications_ac_test.sh`
- `_bmad-output/implementation-artifacts/5-1-create-documentation-for-adding-publications.md`
- `_bmad-output/implementation-artifacts/sprint-status.yaml`

## Senior Developer Review (AI)

### Review Date

2026-03-25

### Outcome

Changes Requested -> Fixed Automatically

### Issues Fixed

- Story/Governance: status mismatch between story file and sprint tracking resolved.
- AC/NFR: added explicit under-10-minutes workflow guidance.
- Documentation consistency: frontmatter docs aligned with template and layout behavior.
- Test coverage: added Story 5.1 AC verification script.

### Residual Risk

- One unrelated failing script remains in Story 5.2 scope (`spec/content_management_projects_ac_test.sh`) due to image path expectation mismatch.

## Change Log

- 2026-03-25: Applied automatic code-review fixes for Story 5.1; marked story as done; synced sprint tracking.
