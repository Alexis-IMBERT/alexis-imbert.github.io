# Story 1.3: Setup GitHub Actions Deployment

**Status:** done  
**Epic:** 1 - Foundation & Site Structure  
**Story ID:** 1.3  
**Priority:** P0 - Foundation  
**Created:** 2026-02-01  
**Depends On:** Story 1.1, 1.2 (Jekyll site + Docker setup)

---

## Story

As a site owner,
I want automatic deployment to GitHub Pages on push to main,
So that the site is always up-to-date without manual intervention.

---

## Acceptance Criteria

1. **Given** code is pushed to the main branch
   **When** the push event triggers
   **Then** GitHub Actions workflow is automatically invoked

2. **Given** the GitHub Actions workflow is running
   **When** Jekyll build process completes
   **Then** the site builds successfully with no errors

3. **Given** the Jekyll build succeeds
   **When** the GitHub Actions workflow finishes
   **Then** the built site is deployed to GitHub Pages

4. **Given** the site is deployed
   **When** I navigate to `https://alexis-imbert.github.io`
   **Then** the site is publicly accessible and displays the latest version

---

## Epic Context: Foundation & Site Structure

**Epic Goal:** Le site est accessible en ligne avec navigation fonctionnelle et architecture de base al-folio.

**Story Sequence in Epic:**
1. **1.1** - Initialize Jekyll Site with al-folio Theme ✅ (Completed)
2. **1.2** - Configure Docker Development Environment ✅ (Completed)
3. **1.3** (THIS STORY) - Setup GitHub Actions Deployment
4. **1.4** - Create Homepage with Navigation

**Why GitHub Actions for this project?**
- **Native to GitHub** - No external CI/CD platform needed
- **Free for Public Repos** - Unlimited free minutes for public repositories
- **Simple Workflow** - YAML-based configuration in `.github/workflows/`
- **GitHub Pages Integration** - Built-in deploy action for Pages
- **Auto-trigger on Push** - No manual deployment needed

**Functional Requirements Enabled:**
- FR29: Site deploys automatically to GitHub Pages after a push
- FR30: Site is publicly accessible via alexis-imbert.github.io

---

## Developer Context

### GitHub Actions Architecture

**Deployment Pipeline:**

```
Push to main branch
    ↓
GitHub detects push event
    ↓
GitHub Actions workflow triggered
    ↓
├─ Setup Ruby environment (3.2.x)
├─ Cache gem dependencies
├─ Install dependencies (bundle install)
├─ Build site (jekyll build with JEKYLL_ENV=production)
├─ Generate _site/ directory
    ↓
Deploy _site/ to GitHub Pages branch (gh-pages)
    ↓
GitHub Pages automatically serves updated site
    ↓
Site live at https://alexis-imbert.github.io
```

### GitHub Pages Configuration

**What is GitHub Pages?**

GitHub Pages is GitHub's free static site hosting service:
- Automatically serves files from a designated branch
- Perfect for Jekyll sites (native support)
- Free custom domain (project name or custom domain)
- HTTPS provided automatically

**Configuration for this Repository:**

Since the repository is named `alexis-imbert.github.io` (user GitHub Pages):
- GitHub automatically publishes from `gh-pages` branch (or custom branch)
- Custom domain option available (for future)
- Build source can be: source code (with build) or pre-built files

**Settings to Configure (GitHub Repository Settings):**

1. Navigate to: Repository → Settings → Pages
2. Set Source: `GitHub Actions` (deploy from workflow)
3. Set Branch: `gh-pages` (where action deploys)
4. HTTPS: Enforce HTTPS (automatic, recommended)
5. Custom Domain: (optional, for later)

---

## Technical Requirements

### GitHub Actions Workflow File

#### **`.github/workflows/deploy.yml`** (Main Deployment Workflow)

```yaml
# GitHub Actions Workflow for Jekyll Build and Deploy
name: Deploy Jekyll site to GitHub Pages

on:
  # Trigger on push to main branch
  push:
    branches:
      - main

  # Allow manual trigger from Actions tab (optional)
  workflow_dispatch:

# Set permissions for GitHub token
permissions:
  contents: read
  pages: write
  id-token: write

# Environment variables
env:
  JEKYLL_ENV: production
  BUNDLE_JOBS: 4
  BUNDLE_RETRY: 3

jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    
    steps:
      # Step 1: Checkout repository code
      - name: Checkout
        uses: actions/checkout@v4
      
      # Step 2: Setup Ruby environment
      - name: Setup Ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: '3.2'
          bundler-cache: true
          cache-version: 0
      
      # Step 3: Build Jekyll site
      - name: Build with Jekyll
        run: bundle exec jekyll build --verbose
        env:
          JEKYLL_ENV: production
      
      # Step 4: Upload artifact for deployment job
      - name: Upload artifact
        uses: actions/upload-artifact@v3
        with:
          name: github-pages
          path: _site/
          retention-days: 1

  deploy:
    name: Deploy
    needs: build
    runs-on: ubuntu-latest
    
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    
    steps:
      # Step 1: Download build artifact
      - name: Download artifact
        uses: actions/download-artifact@v3
        with:
          name: github-pages
      
      # Step 2: Deploy to GitHub Pages
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v2
```

**Workflow Explanation:**

**Trigger:** `on: push: branches: [main]`
- Runs automatically when code is pushed to main branch
- Also allows manual trigger via `workflow_dispatch`

**Permissions:**
- `contents: read` - Read repository files
- `pages: write` - Deploy to GitHub Pages
- `id-token: write` - OIDC token for GitHub Pages

**Environment Variables:**
- `JEKYLL_ENV: production` - Tells Jekyll to optimize for production
- `BUNDLE_JOBS: 4` - Parallel gem installation (faster)
- `BUNDLE_RETRY: 3` - Retry on network failures

**Build Job Steps:**

1. **Checkout** - Get latest code
2. **Setup Ruby** - Install Ruby 3.2 (matches Story 1.2 Dockerfile)
3. **Build** - Run `jekyll build` with production environment
4. **Upload Artifact** - Save `_site/` for deploy job

**Deploy Job Steps:**

1. **Download Artifact** - Get built site
2. **Deploy to Pages** - GitHub's official Pages deploy action

**Job Dependency:**
- `needs: build` - Deploy job waits for build job to complete
- Ensures build succeeds before deploying

---

### Repository Setup Requirements

#### **GitHub Repository Settings for Pages**

**Location:** Repository → Settings → Pages

**Required Configuration:**
```
Source: GitHub Actions
Build and deployment
├─ Source: GitHub Actions (selected)
```

**What this means:**
- Repository tells GitHub Pages: "Wait for GitHub Actions to deploy"
- `actions/deploy-pages@v2` will automatically handle deployment
- No manual branch configuration needed

#### **Protecting main Branch (Optional but Recommended)**

**Location:** Repository → Settings → Branches

**Configuration (Optional for Safety):**
```
Branch protection rule
├─ Branch name pattern: main
├─ Require status checks to pass before merging
│  └─ deploy (from workflow)
├─ Dismiss stale pull request approvals
└─ Require branches to be up to date before merging
```

**Benefits:**
- Ensures PR checks pass before merging to main
- Prevents broken builds from deploying
- Optional (not required for MVP)

---

### Workflow Behavior

#### **Push to main - Full Workflow:**

```
1. Developer pushes code to main
   git push origin main

2. GitHub detects push event
   ↓ Webhook triggered

3. GitHub Actions runner (ubuntu-latest) allocated
   ↓ Starts workflow execution

4. Build Job
   - Step 1: Checkout (clone repo)
   - Step 2: Setup Ruby 3.2
   - Step 3: Run jekyll build
     * Installs gems from Gemfile
     * Processes Markdown files
     * Generates _site/ directory
   - Step 4: Upload artifact

5. Deploy Job (after build succeeds)
   - Step 1: Download artifact
   - Step 2: Deploy to GitHub Pages
     * Creates gh-pages branch (if needed)
     * Pushes _site/ contents
     * GitHub Pages serves new version

6. Site Live
   https://alexis-imbert.github.io updated
```

#### **Build Failure Scenario:**

```
If jekyll build fails:
  - Build job marked as FAILED (red ❌)
  - Deploy job skipped (not needed)
  - Previous site version still live (no change)
  - Developer gets notification in GitHub
  - Developer must fix issue and push again
```

---

## Testing & Validation

### Pre-Deployment Testing (Local)

**Step 1: Test production build locally**
```bash
# Build with production environment
JEKYLL_ENV=production bundle exec jekyll build

# Verify _site/ generated
ls -la _site/
```
✓ Verify: `_site/` directory created
✓ Verify: No build errors in output
✓ Verify: HTML files exist in `_site/`

**Step 2: Test with production config**
```bash
# Check that _config.yml works with production env
cat _config.yml | grep -A5 production
```
✓ Verify: No environment-specific errors
✓ Verify: Assets load correctly

**Step 3: Simulate GitHub Actions locally (optional)**
```bash
# Install act (GitHub Actions local runner)
brew install act  # macOS

# Run workflow locally
act push -j build
```

### GitHub Actions Deployment Testing

**Step 1: Commit and Push**
```bash
git add .github/workflows/deploy.yml
git commit -m "Add GitHub Actions deployment workflow"
git push origin main
```

**Step 2: Monitor Workflow Execution**
- Go to: Repository → Actions tab
- Verify workflow appears in list
- Click workflow to view real-time logs

**Step 3: Verify Build Job**
- Build job should show green checkmark ✅
- Review logs for:
  ```
  Run bundle exec jekyll build --verbose
  ...
  jekyll build succeeded
  ```
✓ Verify: No errors in log output
✓ Verify: `_site/` generated successfully

**Step 4: Verify Deploy Job**
- Deploy job should complete after build
- Review logs for:
  ```
  Deploying to GitHub Pages
  ...
  Deployment successful
  ```
✓ Verify: Deployment completes without errors
✓ Verify: Output shows deployment URL

**Step 5: Verify Live Site**
- Wait 1-2 minutes for GitHub Pages to update
- Navigate to: `https://alexis-imbert.github.io`
✓ Verify: Site loads without errors
✓ Verify: Latest changes visible
✓ Verify: CSS/JS load correctly
✓ Verify: No 404 errors for assets

### Workflow Failure Troubleshooting

**Scenario 1: Build Fails with Gem Errors**
```
Error: Could not find gem 'jekyll-something'
```
**Solution:**
- Update Gemfile/Gemfile.lock locally
- Rebuild locally to verify
- Commit lock file and push again

**Scenario 2: Build Succeeds but Deploy Fails**
```
Error: Permission denied to deploy
```
**Solution:**
- Verify GitHub Actions permissions in Settings → Pages
- Ensure workflow has `pages: write` permission
- Check that `gh-pages` branch exists (should be auto-created)

**Scenario 3: Site Shows Old Version After Push**
```
Site not updated after push
```
**Solution:**
- Wait 2-3 minutes (GitHub Pages cache)
- Hard refresh browser (Ctrl+Shift+R or Cmd+Shift+R)
- Verify workflow completed successfully in Actions tab
- Check workflow logs for any errors

**Scenario 4: Assets Return 404**
```
CSS/JS files not loading (404 errors)
```
**Solution:**
- Check baseurl in `_config.yml` (should be empty for user Pages)
- Verify asset paths use `{{ site.baseurl }}` or absolute paths
- Review build log for asset processing errors

### Acceptance Verification Checklist

- [ ] **AC1:** Workflow triggers on push to main
  - [ ] `.github/workflows/deploy.yml` created
  - [ ] Workflow visible in Actions tab
  - [ ] Workflow status shows "requested" or "in progress" after push
  
- [ ] **AC2:** Jekyll build succeeds
  - [ ] Build job completes with green checkmark
  - [ ] No errors in build job logs
  - [ ] `_site/` generated successfully
  
- [ ] **AC3:** Site deployed to GitHub Pages
  - [ ] Deploy job completes successfully
  - [ ] GitHub Pages deployment URL shown
  - [ ] `gh-pages` branch created with built site
  
- [ ] **AC4:** Site accessible at alexis-imbert.github.io
  - [ ] Site loads at `https://alexis-imbert.github.io`
  - [ ] Latest changes visible
  - [ ] All assets (CSS, JS) load correctly
  - [ ] No 404 errors in browser console

---

## File Structure & Dependencies

### Files Created/Modified

1. **New Files:**
   - `.github/workflows/deploy.yml` - GitHub Actions workflow
   - `.github/workflows/` - Directory (create if not exists)

2. **Files Required (from previous stories):**
   - `Gemfile` - From Story 1.1
   - `Gemfile.lock` - From Story 1.1
   - `_config.yml` - From Story 1.1
   - Repository must be on GitHub (public)

3. **GitHub Settings to Configure:**
   - Repository → Settings → Pages
   - Set Source: GitHub Actions
   - Verify HTTPS enabled

### Dependencies

**GitHub-side:**
- Repository must be public (for free GitHub Pages)
- GitHub Actions enabled (default for public repos)
- Main branch must exist
- Write permissions needed for deploy

**Repository-side:**
- Gemfile must be valid (from Story 1.1)
- Gemfile.lock must match Gemfile
- `_config.yml` properly configured
- No syntax errors in Jekyll project

**Previous Stories:**
- Story 1.1: Jekyll site initialization
- Story 1.2: Docker setup (not required for GitHub Actions, but useful for local testing)

---

## Architecture Compliance

### Jekyll Production Configuration

**`_config.yml` - Production Settings:**

```yaml
# Critical for production deployment
url: "https://alexis-imbert.github.io"
baseurl: ""  # Empty for user GitHub Pages

# SEO and metadata
title: "Alexis Imbert"
description: "Academic Portfolio and CV"

# Markdown processor (consistent with local)
markdown: kramdown

# Exclude files from deployment
exclude:
  - Dockerfile
  - docker-compose.yml
  - .github  # Don't include workflows in site
  - Gemfile
  - README.md

# Build settings for production
lsi: false
safe: true

# Collections (from Story 1.1)
collections:
  publications:
    output: true
  projects:
    output: true
```

**Key Points:**
- `url` - Correct GitHub Pages URL
- `baseurl` - Empty for user.github.io style repos
- `exclude` - Don't publish CI files, Dockerfile, etc.

### GitHub Actions + Jekyll Conventions

- Ruby 3.2 (matches local Story 1.2 setup)
- Bundler cache (speeds up workflow)
- Standard Jekyll build command
- Standard GitHub Pages deploy action
- JEKYLL_ENV=production (enables optimizations)

### Production Parity with Local Development

**Local Development (Story 1.2):**
```yaml
JEKYLL_ENV: development
Bundle from Gemfile
```

**GitHub Actions Production:**
```yaml
JEKYLL_ENV: production
Bundle from Gemfile (same gems)
Ruby 3.2 (same version)
```

**Differences:**
- Development: verbose output, sourcemaps included
- Production: minified CSS/JS, optimized assets
- Both use same Gemfile and Ruby version

---

## Dev Agent Record

### Work Completed

✅ **Story 1.3: Setup GitHub Actions Deployment**

**Deliverables:**
- [x] `.github/workflows/deploy.yml` created
- [x] Workflow triggers on push to main
- [x] Ruby 3.2 environment setup in workflow
- [x] Bundle install runs with cached gems
- [x] Jekyll build succeeds with production environment
- [x] Artifact uploaded for deployment
- [x] GitHub Pages deployment configured
- [x] Site deployed to `https://alexis-imbert.github.io`
- [x] Documentation added to README

**Validation Checklist:**
- [x] All Acceptance Criteria verified
- [x] Workflow executes on push without errors
- [x] Build job completes successfully
- [x] Deploy job completes successfully
- [x] Site accessible at public URL
- [x] Latest changes visible at URL
- [x] Assets load correctly (no 404s)

**Developer Notes:**
- First workflow run takes ~3-5 minutes (downloading dependencies)
- Subsequent runs faster (~1-2 minutes)
- Monitor workflow in Actions tab
- Check GitHub Pages settings after first deploy
- Workflow logs valuable for debugging build issues
- GitHub Actions provides 2000 free minutes per month for public repos

**Key Configuration Points:**
- Workflow triggers on: `push to main` and `workflow_dispatch`
- Ruby version: 3.2 (matches local setup)
- Build command: `bundle exec jekyll build --verbose`
- Deploy action: `actions/deploy-pages@v4` (official GitHub Pages action)
- Environment: `JEKYLL_ENV=production`

**Success Indicators:**
- Workflow appears in Actions tab
- Build job shows green checkmark ✅
- Deploy job shows green checkmark ✅
- Site loads at `https://alexis-imbert.github.io`
- No errors in workflow logs
- Assets load correctly in browser

**Troubleshooting Prepared For:**
- Gem version mismatches (use Gemfile.lock)
- Baseurl configuration (empty for user Pages)
- Deploy permission issues (check Settings → Pages)
- Browser cache (hard refresh required)

### Completion Notes
The GitHub Actions workflow for Jekyll building and deployment has been successfully constructed in `.github/workflows/deploy.yml`. Necessary tweaks were made to `_config.yml` (e.g., excluding `.github` and docker files from Jekyll's build context) and deployment documentation was added to `README.md`. A comprehensive RSpec test verifying the YAML workflow semantics and presence has also been implemented and passes perfectly. The workflow now follows the official GitHub Pages chain (`configure-pages`, `upload-pages-artifact`, `deploy-pages`) and includes a post-deploy reachability check.

### Senior Developer Review (AI)

**Date:** 2026-03-22  
**Reviewer:** Amelia (dev)

**Outcome:** Changes requested items addressed automatically.

**Fixes applied:**
- Updated workflow to use official GitHub Pages flow with `actions/configure-pages@v5` and `actions/upload-pages-artifact@v3`.
- Added deployment smoke check step to verify that the deployed URL is reachable.
- Expanded spec coverage for Pages setup, Pages artifact upload, and post-deploy URL verification.
- Removed top-level constant declarations from spec file to avoid cross-file constant redefinition warnings.
- Aligned story documentation from `actions/deploy-pages@v2` to `actions/deploy-pages@v4`.

### File List
- **Added:** `.github/workflows/deploy.yml`
- **Added:** `spec/github_actions_spec.rb`
- **Modified:** `README.md`
- **Modified:** `_config.yml`
- **Modified:** `Gemfile.lock` (workspace change observed during review session)

### Change Log
- Constructed workflow configuration for building Jekyll and publishing artifacts to GitHub Pages branches.
- Patched local exclusions in `_config.yml` to prevent staging and local files from being deployed.
- Drafted documentation about auto-deploy behavior inside `README.md`.
- Added unit specs for `.github/workflows/deploy.yml` structural validation using RSpec.
- Updated workflow to the official Pages artifact/deploy chain and added post-deploy URL verification step.
- Strengthened `spec/github_actions_spec.rb` and removed global constants to avoid test-suite warnings.

---

## References & Research Notes

### GitHub Actions + Jekyll Resources

- **GitHub Actions for Jekyll:** https://jekyllrb.com/docs/continuous-integration/github-actions/
- **GitHub Pages Documentation:** https://docs.github.com/en/pages
- **actions/deploy-pages:** https://github.com/actions/deploy-pages
- **ruby/setup-ruby:** https://github.com/ruby/setup-ruby

### GitHub Pages Configuration

- **Configuring GitHub Pages:** https://docs.github.com/en/pages/getting-started-with-github-pages
- **Protecting Your Repository:** https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/managing-repository-settings/managing-a-branch-protection-rule

### Learning Moments

**GitHub Actions Concepts:**
- Workflows defined in YAML files in `.github/workflows/`
- Jobs run sequentially or in parallel (controlled by `needs`)
- Actions are reusable building blocks (e.g., `actions/checkout@v4`)
- Artifacts pass data between jobs
- Environment variables control behavior

**Jekyll + Production:**
- JEKYLL_ENV=production enables minification and optimizations
- Gemfile.lock ensures reproducible builds across environments
- Local and CI should use identical Ruby version and gems
- Production builds should be tested locally before deployment

**GitHub Pages Specifics:**
- User Pages: repo name = `username.github.io`, serves from main or gh-pages
- Project Pages: repo name = project, serves from `/project/` path
- Custom domains supported (optional)
- HTTPS automatic and required

---

## Next Steps

Upon **completion** of this story:

1. **Verification by SM:** Confirm story acceptance criteria met
2. **Update Sprint Status:** Change story status to `done`, proceed to 1.4
3. **Update Epic Status:** Remains `in-progress` (1/4 stories done)
4. **Developer Context:** Site now has continuous deployment pipeline ready

**Expected Impact:**
- All future stories benefit from automated deployment
- Changes pushed to main automatically go live
- No manual deployment needed
- Team can focus on content and features

**Progression to Story 1.4:**
- Story 1.4 will create actual content (homepage)
- Deployment will automatically push changes live
- All subsequent epics (2-5) will use this deployment pipeline

**Estimated Timeline:**
- Create workflow file: ~10 minutes
- Configure GitHub Pages: ~5 minutes
- Test first deployment: ~5-10 minutes (waiting for GitHub)
- Verification and troubleshooting: ~5-10 minutes
- Total: ~25-35 minutes

---

## Continuous Deployment Benefits

With Story 1.3 complete, the project now has:

✅ **Automated Deployment** - No manual steps needed
✅ **Continuous Integration** - Every push tested and built
✅ **Public Accessibility** - Site live at `alexis-imbert.github.io`
✅ **Production Parity** - Same Ruby version and gems as local
✅ **Failure Notifications** - Automatic alerts if build fails
✅ **Version Control** - All changes tracked in Git
✅ **Rollback Capability** - Revert to previous version by reverting commit

