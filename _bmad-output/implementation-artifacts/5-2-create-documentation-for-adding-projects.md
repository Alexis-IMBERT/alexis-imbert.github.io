# Story 5.2: create-documentation-for-adding-projects

Status: review

<!-- Note: Validation is optional. Run validate-create-story for quality check before dev-story. -->

## Story

As a site owner,
I want clear documentation on how to add a new project,
So that I can showcase new work easily.

## Acceptance Criteria

1. I see step-by-step instructions for creating a project file
2. I see the required frontmatter fields explained
3. I see an example project file with image handling

## Tasks / Subtasks

- [x] **Task 1: Determine documentation location**
  - [x] Decide where to best place these instructions (e.g., `README.md`, `CONTENT_GUIDE.md`, or extending the existing repository documentation).
- [x] **Task 2: Write step-by-step instructions**
  - [x] Document copying `_projects/_TEMPLATE.md` to create a new `.md` file in `_projects/`.
  - [x] Detail the frontmatter fields required based on the schema: `title`, `description`, `technologies`, `github_url`, `demo_url`, `image`.
  - [x] Explain how to handle images (where to store them typically in `assets/` and how to reference them).
- [x] **Task 3: Example inclusion**
  - [x] Provide or reference an example file so the owner sees exactly what it should look like.
  - [x] Emphasize saving the file and using `docker-compose up` to preview changes locally.

## Dev Notes

- **Relevant architecture patterns and constraints**: This relates to local content management. You should specifically guide the owner to use `_projects/_TEMPLATE.md` that already exists.
- **Source tree components to touch**: Either `README.md` or a new `HOW_TO_ADD_CONTENT.md`. Given Story 5.1 and 5.3 also need documentation, you can create a unified content management guide (e.g. `CONTENT_MANAGEMENT.md`) or put it in a specific `docs/` folder, or just use `README.md`.
- **Testing standards summary**: Verify the markdown formatting renders properly on GitHub.

### Project Structure Notes

- **Collections**: `_projects/` folder already has a `_TEMPLATE.md` file. Instruct the site owner to duplicate this template when creating new projects.
- **Images**: Instruct the site owner to place images under `assets/images/` or `assets/img/` (the template uses `/assets/img/project-placeholder.jpg`). Suggest they check the `assets/` structure before putting the instruction.

### References

- **epics.md**: [Source: _bmad-output/planning-artifacts/epics.md#Epic%205]
- **Frontmatter Schema**: `title, description, technologies, github_url, demo_url, image`

## Dev Agent Record

### Agent Model Used

Gemini 3.1 Pro (Preview)

### Debug Log References
- Decided to create a standalone `CONTENT_MANAGEMENT.md` to cleanly separate this from the general README.md.
- Followed frontmatter schema and _TEMPLATE.md exact requirements.
- Auto-review fix: aligned image paths to `assets/images` based on actual repo structure.
- Auto-review fix: strengthened AC test checks to validate section coverage and image frontmatter example.

### Completion Notes List
- ✅ Created `CONTENT_MANAGEMENT.md` with instructions mapped exactly to the required ACs.
- ✅ Added a bash test to reliably grep the fields, image instructions, and template references.
- ✅ Updated `_projects/_TEMPLATE.md` image placeholder path to `/assets/images/project-placeholder.jpg` for consistency.
- ✅ Synced sprint tracking status for 5.2 from `backlog` to `review` to match story status.

### File List
- `CONTENT_MANAGEMENT.md`
- `spec/content_management_projects_ac_test.sh`
- `_projects/_TEMPLATE.md`
- `_bmad-output/implementation-artifacts/sprint-status.yaml`
