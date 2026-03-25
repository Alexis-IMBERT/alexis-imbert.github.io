# Story 5.4: Verify Docker Compose Local Preview

Status: review

<!-- Note: Validation is optional. Run validate-create-story for quality check before dev-story. -->

## Story

As a site owner,
I want the Docker Compose environment to work seamlessly,
So that I can preview changes locally before deploying.

## Acceptance Criteria

1. **Given** Docker and Docker Compose are installed
   **When** I run `docker-compose up`
   **Then** the site builds and is accessible at `localhost:4000`
2. **And** file changes trigger automatic rebuild (live reload)
3. **And** the local environment matches production settings
4. **And** instructions for using Docker are documented

## Tasks / Subtasks

- [x] Task 1: Verify existing Docker Compose environment (AC: 1, 3)
  - [x] Check `docker-compose.yml` and `Dockerfile` configuration.
  - [x] Ensure the Ruby version matches the one required by GitHub Pages.
  - [x] Verify that port 4000 (and livereload port 35729) are correctly exposed.
- [x] Task 2: Ensure Live Reload works (AC: 2)
  - [x] Verify `jekyll serve` command is configured with `--watch`, `--livereload` and `--force_polling` flags (required if using Docker on Mac/Windows).
- [x] Task 3: Document Docker setup (AC: 4)
  - [x] Check/add instructions in README.md or related setup documentation for starting the site locally via `docker-compose up`.

## Dev Notes

- **Relevant architecture patterns and constraints**: This project uses Jekyll with the al-folio theme. The Docker container needs to run `jekyll serve` optimally to replicate the GitHub Pages environment locally.
- **Source tree components to touch**:
  - `docker-compose.yml`
  - `Dockerfile`
  - `README.md`
- **Testing standards summary**: Verify the environment locally to ensure that saving a file instantly triggers site rebuild on `localhost:4000` without a manual container restart.

### Project Structure Notes

- Alignment with unified project structure: Standard Jekyll Docker setup.

### References

- [Source: Epic Breakdown `_bmad-output/planning-artifacts/epics.md#epic-5-content-management--local-dev`]

## Dev Agent Record

### Agent Model Used

Gemini 3.1 Pro (Preview)

### Debug Log References

- Added `--watch` to Dockerfile
- Validated setup locally with `rspec spec/docker_env_spec.rb` and `bash spec/docker_preview_ac_test.sh`

### Completion Notes List

- Verified existing `docker-compose.yml` mapped ports correctly and preserved expected configuration.
- Added `--watch` flag in `Dockerfile` to `jekyll serve` to ensure strict live-reloading compatibility along with existing flags.
- Checked `README.md` content and verified local development instructions exist and match expectation.
- Authored BASH based test tests `spec/docker_preview_ac_test.sh` and extended RSpec tests to confirm ACs are met.

### File List

- `Dockerfile`
- `spec/docker_env_spec.rb`
- `spec/docker_preview_ac_test.sh`
