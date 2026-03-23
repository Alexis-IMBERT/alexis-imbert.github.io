# Story 4.2: Create Projects List Page

Status: ready-for-dev

<!-- Note: Validation is optional. Run validate-create-story for quality check before dev-story. -->

## Story

As a visitor (Marc the tech recruiter),
I want to see a list of all projects,
so that I can explore Alexis's practical work and open-source contributions.

## Acceptance Criteria

1. **Given** I navigate to the Projects page
   **When** the page loads
   **Then** I see all projects displayed (grid or list layout)
2. **And** each project shows: title, brief description, thumbnail/image (if available)
3. **And** each project has a link to its detail page
4. **And** the page is accessible from the main navigation
5. **And** the page has proper SEO meta tags

## Tasks / Subtasks

- [ ] Task 1: Enhance `projects.md` to display projects in a grid or list (AC: 1, 2, 3)
  - [ ] Modify `projects.md` to loop through `site.projects` and build a better layout (grid or styled list).
  - [ ] Display `project.title`, `project.description`, and `project.image` (if available).
  - [ ] Add a link wrapping the title/image pointing to `project.url`.

- [ ] Task 2: Verify Navigation & SEO Elements (AC: 4, 5)
  - [ ] Ensure `nav_menu` in `_config.yml` correctly links to `/projects/`.
  - [ ] Ensure that `projects.md` has the `title` and `description` defined in the frontmatter for Jekyll SEO tag.

## Dev Notes

- Relevant architecture patterns and constraints: The site uses the `al-folio` theme. Follow its design language for grids/lists where possible (e.g., Bootstrap classes if applicable or default layouts the theme supports). If no specific project grid is available in al-folio, create a clean CSS/HTML list.
- Source tree components to touch: `projects.md`, `_config.yml` (if needed for navigation check, but it might already exist).
- Testing standards summary: Run Jekyll locally. Navigate to `/projects/`. Ensure a placeholder project in `_projects` is rendered properly with its title, description and image.

### Project Structure Notes

- Need to rely on `title`, `description`, `image`, `github_url`, `demo_url` frontmatter fields inside `_projects/*.md` files.
- The `projects.md` file already exists but only implements a very basic bullet point list. It needs to be enhanced significantly to meet the AC.

### References

- [Source: _bmad-output/planning-artifacts/epics.md#Story-4-2-Create-Projects-List-Page]
- `projects.md`

## Dev Agent Record

### Agent Model Used

{{agent_model_name_version}}

### Debug Log References

### Completion Notes List

### File List