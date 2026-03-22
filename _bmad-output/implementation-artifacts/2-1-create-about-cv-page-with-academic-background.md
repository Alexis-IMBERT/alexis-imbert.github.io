# Story 2.1: Create About/CV Page with Academic Background

Status: done

## Story

As a visitor (Sophie the academic recruiter),
I want to see Alexis's academic background and career path,
so that I can assess his research experience and academic qualifications.

## Acceptance Criteria

1. Given I navigate to the About/CV page, when the page loads, then I see academic background (education, degrees, institutions).
2. Given I navigate to the About/CV page, when the page loads, then I see professional experiences (current position, previous roles).
3. Given I navigate to the About/CV page, when the page loads, then the content is structured with semantic HTML.
4. Given I use the top navigation menu, when I select About/CV, then the page is accessible from navigation.

## Tasks / Subtasks

- [x] Create About/CV page content
  - [x] Add a new page for About/CV with frontmatter title, description, permalink, and layout.
  - [x] Add sections for academic background and professional experience.
  - [x] Use semantic HTML via Markdown structure with clear headings (`h1`, `h2`, lists).
- [x] Add navigation access to About/CV
  - [x] Update `nav_menu` in `_config.yml` to include About/CV.
  - [x] Validate that header navigation renders the new item through `_includes/header.html` loop.
- [x] Ensure metadata and accessibility baseline
  - [x] Add page-level meta description in frontmatter.
  - [x] Confirm heading order is logical and links are descriptive.
- [x] Validate responsive behavior
  - [x] Verify About/CV page layout at desktop, tablet, and mobile widths.
  - [x] Confirm menu toggle still works with added nav item.
- [x] Verify local and deployment compatibility
  - [x] Validate with Docker-based local preview.
  - [x] Confirm no change breaks GitHub Pages compatibility expectations.

## Dev Notes

### Story Foundation

- Epic: 2 - Profile & Professional Identity.
- This story starts Epic 2 and establishes the base page for subsequent stories:
  - 2.2 skills section
  - 2.3 external profile links
  - 2.4 CV PDF download
  - 2.5 contact information refinements
- Keep structure extensible so later stories can add sections without reworking page architecture.

### Technical Requirements

- Use existing Jekyll + remote al-folio setup from `_config.yml`.
- Keep page as Markdown + frontmatter (no custom plugin introduction).
- Keep compatibility with GitHub Pages dependency set; avoid unsupported plugins or newer-only features.
- Keep semantic structure for accessibility and SEO.

### Architecture Compliance

- Respect existing project conventions:
  - Root pages currently exist as Markdown (`index.md`) with frontmatter and `layout: default`.
  - Navigation is driven by `_config.yml` `nav_menu` and rendered by `_includes/header.html`.
  - Global layout is in `_layouts/default.html` and already contains responsive navigation behavior.
- Do not duplicate or fork header logic for this story; integrate through existing config-driven navigation.

### Library and Framework Requirements

- Jekyll static generation conventions only.
- Keep Ruby/Jekyll compatibility aligned with GitHub Pages baseline.
- No new third-party frontend framework or JavaScript dependency for this story.

### File Structure Requirements

- Expected files to touch:
  - `_config.yml` (add About/CV nav entry)
  - New About page file (recommended pattern: `about.md` in project root to match current page strategy)
- Keep `_layouts/default.html` and `_includes/header.html` unchanged unless a blocking defect is discovered.
- If a different path is chosen (for example `_pages/about.md`), ensure permalink and nav href remain consistent.

### Testing Requirements

- Manual functional checks:
  - Start local preview with Docker and load About/CV page.
  - Confirm About/CV appears in top nav and links correctly.
  - Confirm page renders on mobile and menu toggle still works.
- Content checks:
  - Verify academic and professional sections are both present.
  - Verify semantic heading hierarchy and readable structure.
- Regression checks:
  - Home, Publications, Projects, Contact links still work.
  - No Liquid/frontmatter build errors.

## Project Structure Notes

- Current implementation uses a lightweight custom layout and config-based nav.
- Story 2.1 should preserve this simple architecture and avoid introducing alternate content routing patterns.
- Future Epic 2 stories should layer onto this About page, not split into multiple disconnected pages.

## Latest Technical Information

- Jekyll documentation indicates Ruby 2.7+ prerequisite and standard content model through pages/collections.
- GitHub Pages published dependency set includes managed Jekyll stack; this supports conservative, compatibility-first implementation.
- al-folio latest release exists upstream (`v0.16.3` at time of analysis), but this story should avoid theme-level upgrades and stay within current repo baseline.

## References

- [Source: _bmad-output/planning-artifacts/epics.md#Epic 2: Profile & Professional Identity]
- [Source: _bmad-output/planning-artifacts/epics.md#Story 2.1: Create About/CV Page with Academic Background]
- [Source: _bmad-output/planning-artifacts/prd.md#Functional Requirements]
- [Source: _bmad-output/planning-artifacts/prd.md#Domain-Specific Requirements]
- [Source: _config.yml#Navigation menu items]
- [Source: _includes/header.html]
- [Source: _layouts/default.html]
- [Source: index.md]

## Dev Agent Record

### Agent Model Used

Gemini 3.1 Pro (Preview)

### Debug Log References

- Story prepared from epic + PRD + repository architecture context.
- No architecture planning artifact file found under planning artifacts; requirements inferred from implemented repository structure.
- `about.md` and `_config.yml` were analyzed and updated appropriately to satisfy ACs.
- `spec/about_cv_spec.rb` implemented testing the presence of headers, sections, and proper rendering to satisfy requirement for 100% test passing before review.

### Completion Notes List

- Ultimate context engine analysis completed - comprehensive developer guide created.
- Story is intentionally scoped to establish About/CV foundation only; linked profile icons, CV PDF action, and contact enhancements belong to subsequent stories.
- Created `about.md` with Academic Background and Professional Experience structure.
- Integrated About/CV page securely to navigation `nav_menu` in `_config.yml`.
- Added automated verification spec `spec/about_cv_spec.rb` for content correctness and markup format constraints.

### Senior Developer Review (AI)

- Review date: 2026-03-22
- Outcome: Approved after automatic fixes.
- Fixes applied:
  - Added explicit navigation AC validation in `spec/about_cv_spec.rb`.
  - Added dedicated Story 2.1 acceptance script `spec/about_story_2_1_ac_test.sh` validating generated HTML, not only source grep checks.
  - Synchronized story status and sprint tracking to `done`.
  - Added branch context note to avoid Git/File List ambiguity across parallel Epic 2 stories.

### Change Log

- 2026-03-22: Code review auto-fix pass for Story 2.1 (tests strengthened, traceability improved, status synced).

### Git Branch Context (Transparency)

- Current branch contains parallel Epic 2 work (Stories 2.2-2.5) in additional files.
- This Story 2.1 file list intentionally tracks Story 2.1 implementation and review artifacts only.

### File List

- `_bmad-output/implementation-artifacts/2-1-create-about-cv-page-with-academic-background.md`
- `about.md`
- `_config.yml`
- `spec/about_cv_spec.rb`
- `spec/about_story_2_1_ac_test.sh`
