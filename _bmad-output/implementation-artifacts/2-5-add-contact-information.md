# Story 2.5: Add Contact Information

**Status:** done  
**Epic:** 2 - Profile & Professional Identity  
**Story ID:** 2.5  
**Priority:** P0 - Profile Completeness  
**Created:** 2026-03-22  
**Depends On:** Story 1.4 (homepage and navigation in place)

---

## Story

As a visitor,
I want to easily contact Alexis via email,
so that I can reach out for opportunities or collaboration.

---

## Acceptance Criteria

1. **Given** I navigate to the Contact section (or see it on homepage)  
   **When** I click the contact link/button  
   **Then** my email client opens with Alexis's email pre-filled using a `mailto:` link

2. **Given** I am navigating the website  
   **When** I look for contact information  
   **Then** the contact information is easily findable

3. **Given** I use the contact feature  
   **When** I interact with it  
   **Then** no forms or data collection occurs

---

## Tasks / Subtasks

- [x] Add a dedicated contact page with a clear, accessible email CTA (AC: 1, 2, 3)
  - [x] Create `contact.md` with front matter (`layout`, `title`, `description`, `permalink: /contact/`)
  - [x] Add visible contact text and a strong anchor label (for example: "Email Alexis")
  - [x] Implement `mailto:{{ site.email | default: site.author.email }}` as the primary contact action
  - [x] Ensure no contact form element is introduced

- [x] Ensure contact entry points remain discoverable from existing navigation (AC: 2)
  - [x] Verify Contact is present in header navigation (`_includes/header.html` and `nav_menu` fallback)
  - [x] Verify homepage still contains a contact callout/link

- [x] Keep behavior privacy-safe and semantically correct (AC: 1, 3)
  - [x] Use real hyperlink navigation (`<a href="mailto:...">`) rather than button JS hacks
  - [x] Do not add analytics hooks, tracking pixels, or server-side processing for contact

- [x] Add/adjust tests for contact behavior and regressions (AC: 1, 2, 3)
  - [x] Add a shell acceptance test that validates `mailto:` presence in built `/_site/contact/index.html`
  - [x] Assert there is no `<form` on contact page output
  - [x] Keep existing homepage/navigation checks passing

---

## Dev Notes

### Story Foundation

- This story closes FR24 from the PRD and Epic 2 scope.
- Existing project state already includes contact references in navigation and homepage copy, but `/contact/` page does not yet exist and should be implemented as source-of-truth contact destination.

### Technical Requirements

- Keep implementation static and Jekyll-native.
- Prefer deriving the email from configuration to avoid duplication:
  - Primary source: `site.email`
  - Fallback: `site.author.email`
- Keep contact flow to `mailto:` only.
- No client-side contact form or backend endpoint.

### Architecture Compliance

- Respect current stack and patterns already implemented in Epic 1:
  - Jekyll + al-folio theme
  - Content pages in Markdown with YAML front matter
  - Navigation links managed via `_config.yml` and rendered by `_includes/header.html`
- Maintain semantic HTML and accessibility baseline (link text should clearly describe destination/action).

### Library and Framework Requirements

- Do not add new libraries for this story.
- Use existing Jekyll/Liquid primitives only.
- Keep compatibility with current plugin set in `_config.yml` (`jekyll-seo-tag`, `jekyll-sitemap`, `jekyll-feed`, `jekyll-paginate`).

### File Structure Requirements

- Expected primary additions/edits:
  - `contact.md` (new)
  - `index.md` (optional small wording alignment only if needed)
  - `spec/homepage_ac_test.sh` (or new shell spec file) for contact acceptance checks
- Avoid touching deployment, Docker, or publication/project layouts.

### Testing Requirements

- Validate locally with Docker flow used by project (`docker compose up`) and/or static build checks.
- Add regression checks aligned with existing test style:
  - `mailto:` link exists and points to configured address
  - Contact page resolves on `/contact/`
  - No form tags on contact page
  - Navigation still exposes Contact link

### Previous Story Intelligence

- Story 2.4 artifact is not yet present in implementation artifacts; no direct prior Epic 2 dev notes are available.
- Reuse successful Epic 1 pattern: small, test-backed increments with explicit acceptance checks in `spec/`.

### Git Intelligence Summary

Recent commits indicate stable implementation conventions to preserve:

- Stories are committed with synchronized status updates in sprint tracking.
- Acceptance behavior is validated with shell/RSpec checks under `spec/`.
- Navigation and core pages are managed through `_config.yml`, `_includes/header.html`, and top-level markdown pages.

### Latest Technical Information

- `mailto:` is a standard `href` scheme on anchor elements and remains appropriate for no-backend contact flows.
- Accessibility guidance favors explicit, descriptive link text over vague labels.
- For external links opened in new tabs, communicate behavior clearly; for `mailto:`, default navigation behavior is acceptable and expected.

### Project Context Reference

- No `project-context.md` file detected in repository; story context derived from:
  - PRD (`_bmad-output/planning-artifacts/prd.md`)
  - Epics (`_bmad-output/planning-artifacts/epics.md`)
  - Existing implementation artifacts and repository state

### References

- [Source: _bmad-output/planning-artifacts/epics.md (Story 2.5, FR24)]
- [Source: _bmad-output/planning-artifacts/prd.md (FR24, privacy/RGPD section)]
- [Source: _config.yml (site.email, nav_menu)]
- [Source: _includes/header.html (Contact nav link)]
- [Source: index.md (existing mailto usage)]
- [Source: recent git history (last 5 commits)]

---

## Story Completion Status

- Story context document created with implementation guardrails, architecture alignment, testing expectations, and anti-regression guidance.
- Status set to `done` after AI code review fixes.
- Acceptance criteria validated with `spec/contact_ac_test.sh` and `spec/homepage_ac_test.sh`.
- Completion note: kept `contact.md` and `index.md` behavior unchanged, then hardened acceptance tests for configured-email validation and homepage discoverability/reliability.

---

## Dev Agent Record

### Agent Model Used

Gemini 3.5 Pro

### Debug Log References

- Execution of `./spec/contact_ac_test.sh` passed.
- Execution of `./spec/homepage_ac_test.sh` passed against built site fallback.

### Completion Notes List

- All components of the contact page functionality were active in the repository.
- Made a minor fix to `index.md` to properly use Jekyll templating instead of hardcoded raw email for `mailto:` link.
- Hardened `spec/contact_ac_test.sh` to assert configured email in `mailto:` and homepage discoverability.
- Hardened `spec/homepage_ac_test.sh` to support `_site/index.html` fallback when local server is unavailable.
- Verified test coverage with test script execution. Subtasks successfully fulfilled.
- Noted that the working tree also contains parallel changes from other stories; this story file tracks only 2.5 scope changes.

### File List

- `_bmad-output/implementation-artifacts/2-5-add-contact-information.md`
- `contact.md`
- `index.md`
- `spec/contact_ac_test.sh`
- `spec/homepage_ac_test.sh`

### Senior Developer Review (AI)

Date: 2026-03-22

- HIGH fixed: regression claim for homepage checks is now backed by a resilient script path (`spec/homepage_ac_test.sh`) that can validate from URL or built `_site/index.html` fallback.
- MEDIUM fixed: contact AC1 now verifies configured email value appears in `mailto:` output (`spec/contact_ac_test.sh`).
- MEDIUM fixed: contact discoverability now has explicit homepage assertion in contact acceptance test (`spec/contact_ac_test.sh`).
- MEDIUM addressed: story notes now explicitly mention parallel unrelated working-tree edits to avoid scope confusion during review.

### Change Log

- 2026-03-22: Applied AI code review fixes for story 2.5 tests, validated AC evidence, and moved story status to `done`.
