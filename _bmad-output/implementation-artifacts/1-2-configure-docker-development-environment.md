# Story 1.2: Configure Docker Development Environment

**Status:** ready-for-dev  
**Epic:** 1 - Foundation & Site Structure  
**Story ID:** 1.2  
**Priority:** P0 - Foundation  
**Created:** 2026-02-01  
**Depends On:** Story 1.1 (Jekyll site initialized)

---

## Story

As a site owner,
I want a Docker Compose setup for local development,
So that I can preview and develop the site without installing Jekyll locally.

---

## Acceptance Criteria

1. **Given** a configured Jekyll site with al-folio theme
   **When** I run `docker-compose up`
   **Then** the site is accessible at `localhost:4000` without errors

2. **Given** the Docker container is running
   **When** I modify a source file (`.md`, `.yml`, `_config.yml`)
   **Then** the Jekyll build automatically triggers and reloads within 5 seconds

3. **Given** the running development container
   **When** I refresh the browser (`localhost:4000`)
   **Then** the changes are visible immediately (live reload working)

4. **Given** the local Docker development environment
   **When** I compare with production build settings
   **Then** the environment variables and configurations match exactly

---

## Epic Context: Foundation & Site Structure

**Epic Goal:** Le site est accessible en ligne avec navigation fonctionnelle et architecture de base al-folio.

**Story Sequence in Epic:**

1. **1.1** - Initialize Jekyll Site with al-folio Theme ✅ (Completed)
2. **1.2** (THIS STORY) - Configure Docker Development Environment
3. **1.3** - Setup GitHub Actions Deployment
4. **1.4** - Create Homepage with Navigation

**Why Docker for this project?**

- **Consistency:** Development environment matches production (GitHub Pages)
- **Isolation:** No interference with system Ruby, Bundler, or other projects
- **Onboarding:** New contributors can start with one command: `docker-compose up`
- **Compliance:** Ensures exact gem versions across all machines
- **Scalability:** Easy to add more services later (e.g., image optimization, testing)

---

## Developer Context

### Docker Strategy for Jekyll Development

**Why Docker Compose instead of Docker alone?**

1. **Simplicity** - Single command to start entire dev stack
2. **Volume Mounting** - Code changes immediately reflected in container
3. **Port Mapping** - Clean `localhost:4000` without port conflicts
4. **Environment Variables** - Separate dev/prod configurations easily
5. **Future Services** - Easy to add image optimizer, testing containers, etc.

**Docker Architecture for This Project:**

```
┌─────────────────────────────────┐
│   docker-compose.yml            │ ← Orchestrates all services
│   (defines jekyll service)       │
└──────────────┬──────────────────┘
               │
               ├─→ Dockerfile (jekyll service)
               │   ├─ Base: ruby:3.2-alpine (lightweight)
               │   ├─ Install: bundler + jekyll deps
               │   ├─ WORKDIR: /site
               │   └─ CMD: jekyll serve
               │
               ├─→ Volume Mounts
               │   ├─ /repo/src → /site (read-write)
               │   └─ /repo/.bundler-cache → /usr/local/bundle (gem cache)
               │
               └─→ Port Mapping
                   └─ 4000:4000 (HTTP)
```

### File Watch & Live Reload

**How it works:**

1. **File Change Detection**
   - Jekyll container watches `_config.yml`, `_layouts/`, `_includes/`, `_data/`, etc.
   - Docker volume mount propagates changes in real-time to container

2. **Automatic Build**
   - Jekyll detects changes and rebuilds `_site/`
   - Build output logged in container console

3. **Browser Reload**
   - Browser polling/LiveReload picks up new `_site/` changes
   - Page refreshes automatically (or manual refresh needed)

**Note:** al-folio includes LiveReload support; ensure `jekyll serve` runs with `--livereload` or equivalent.

---

## Technical Requirements

### Docker Configuration Files

#### 1. **Dockerfile** (jekyll service)

```dockerfile
# Use lightweight Ruby image (Alpine Linux)
FROM ruby:3.2-alpine

# Set working directory
WORKDIR /site

# Install dependencies (required for building gems)
RUN apk add --no-cache \
    build-base \
    git \
    curl

# Install Bundler
RUN gem install bundler

# Copy Gemfile and Gemfile.lock from Story 1.1
COPY Gemfile Gemfile.lock ./

# Install Ruby gems
RUN bundle install

# Expose port for Jekyll
EXPOSE 4000
EXPOSE 35729

# Run Jekyll with live reload
CMD ["bundle", "exec", "jekyll", "serve", \
     "--host", "0.0.0.0", \
     "--port", "4000", \
     "--livereload"]
```

**Key Configuration Points:**

- **Image:** `ruby:3.2-alpine`
  - Alpine Linux keeps image size small (~50MB vs 300MB+)
  - Ruby 3.2 is stable and well-supported
  
- **Working Directory:** `/site`
  - Internal container path for mounted volume
  
- **Gem Installation:** Happens at build time
  - Uses Gemfile/Gemfile.lock from Story 1.1
  - Ensures reproducible builds across machines
  
- **Port Exposure:**
  - `4000` - Jekyll HTTP server
  - `35729` - LiveReload socket (for browser auto-refresh)
  
- **Jekyll Command:**

  ```bash
  bundle exec jekyll serve --host 0.0.0.0 --port 4000 --livereload
  ```

  - `--host 0.0.0.0` - Accept connections from outside container
  - `--port 4000` - Standard Jekyll port
  - `--livereload` - Enable browser auto-refresh

#### 2. **docker-compose.yml** (service orchestration)

```yaml
version: '3.8'

services:
  jekyll:
    # Build from local Dockerfile
    build: .
    
    # Container name (optional but helps with commands)
    container_name: alexis-imbert-jekyll
    
    # Port mapping: host:container
    ports:
      - "4000:4000"      # Jekyll HTTP server
      - "35729:35729"    # LiveReload socket
    
    # Volume mounts for development
    volumes:
      # Mount source code as read-write
      - .:/site
      
      # Mount gem cache (optional, improves build speed)
      - bundle_cache:/usr/local/bundle
    
    # Environment variables
    environment:
      JEKYLL_ENV: development
      BUNDLE_JOBS: 4
      BUNDLE_RETRY: 3
    
    # Keep container running even if command exits
    stdin_open: true
    tty: true
    
    # Restart policy
    restart: unless-stopped

# Named volume for gem cache persistence
volumes:
  bundle_cache:
```

**Key Configuration Points:**

- **Build Context:** `.` (current directory with Dockerfile)
- **Ports:** `4000` (HTTP) and `35729` (LiveReload)
- **Volumes:**
  - `.:/site` - Mount entire repo as container volume
  - `bundle_cache` - Named volume for gems (speeds up rebuilds)
- **Environment:** `JEKYLL_ENV=development` (tells Jekyll to run in dev mode)
- **Restart Policy:** `unless-stopped` (auto-restart on failure)

#### 3. **.dockerignore** (exclude files from build context)

```
.git
.gitignore
.github
_site
.bundler-cache
node_modules
*.log
.DS_Store
```

**Purpose:** Reduces Docker build context size, speeds up builds.

### Production Environment Matching

**Development (Docker):**

```yaml
JEKYLL_ENV: development
```

**Production (GitHub Pages):**

```yaml
JEKYLL_ENV: production
```

**Why It Matters:**

- Jekyll includes conditional logic: `if jekyll.environment == 'production'`
- CSS/JS minification happens in production
- Analytics code only loads in production
- Gems can behave differently based on environment

**Verification Checklist:**

- [ ] Development builds with `JEKYLL_ENV=development`
- [ ] Production configuration matches GitHub Actions workflow (Story 1.3)
- [ ] No hardcoded URLs (use `{{ site.baseurl }}` instead)
- [ ] Assets work in both dev and prod

---

## Testing & Validation

### Docker Build Verification

**Step 1: Build Docker Image**

```bash
docker-compose build
```

✓ Verify: Build completes without errors
✓ Verify: All gems install successfully (may take 2-3 minutes first time)

**Step 2: Start Container**

```bash
docker-compose up
```

✓ Verify: Container starts without errors
✓ Verify: Console shows: `Server running... press ctrl-c to stop`
✓ Verify: No error messages in console

**Step 3: Access in Browser**

- Navigate to: `http://localhost:4000`
✓ Verify: Site loads without 404 errors
✓ Verify: CSS and JS loaded correctly
✓ Verify: No console errors in browser DevTools

### Live Reload Verification

**Step 1: Open Browser DevTools**

- F12 or Right-click → Inspect → Console tab

**Step 2: Make a File Change**

- Edit any `.md` or `_config.yml` file
- Save the file

**Step 3: Observe Rebuild**

```
# In container console, you should see:
 [2026-02-01 10:30:45] RegeneratingContext: ...
 [2026-02-01 10:30:46] Regenerating: ...
 [2026-02-01 10:30:47] Regenerated in ... seconds
```

**Step 4: Browser Auto-Reload**

- Browser tab should refresh automatically (LiveReload)
- OR manually refresh (F5) if auto-reload not working

✓ Verify: Changes visible within 5 seconds
✓ Verify: No errors in browser console

### Production Environment Matching

**Compare with Story 1.3 GitHub Actions Setup:**

Docker Environment Variables:

```yaml
JEKYLL_ENV: development
```

GitHub Actions Environment (from Story 1.3):

```yaml
JEKYLL_ENV: production
```

**Differences to Verify:**

- [ ] CSS/JS minification works in production
- [ ] Image optimization (if implemented) triggers correctly
- [ ] Analytics/tracking only loads in production
- [ ] Build output differences understood and documented

### Acceptance Verification Checklist

- [ ] **AC1:** Docker container starts and serves site
  - [ ] `docker-compose up` succeeds
  - [ ] Site loads at `localhost:4000`
  - [ ] No 404 errors for assets
  
- [ ] **AC2:** File changes trigger automatic rebuild
  - [ ] Modifying `.md` files triggers Jekyll rebuild
  - [ ] Modifying `_config.yml` triggers rebuild
  - [ ] Container console shows rebuild messages
  
- [ ] **AC3:** Live reload works
  - [ ] Browser auto-refreshes after file change
  - [ ] Changes visible within 5 seconds
  - [ ] LiveReload socket connected (check browser console)
  
- [ ] **AC4:** Environment matches production
  - [ ] `JEKYLL_ENV=development` in docker-compose
  - [ ] No errors in dev environment
  - [ ] Configuration compatible with production (Story 1.3)

---

## File Structure & Dependencies

### Files Created/Modified

1. **New Files:**
   - `Dockerfile` - Jekyll service definition
   - `docker-compose.yml` - Service orchestration
   - `.dockerignore` - Docker build exclusions

2. **Files to Copy from Story 1.1:**
   - `Gemfile` - Must exist in repo root
   - `Gemfile.lock` - Must exist in repo root
   - `_config.yml` - Must exist in repo root

3. **Files Modified:**
   - `.gitignore` - Add Docker-related patterns:

     ```
     # Docker
     .dockerignore
     ```

### Dependencies

**Prerequisites (installed on host machine):**

- Docker Desktop (macOS/Windows) or Docker Engine (Linux)
- Docker Compose (usually included with Docker Desktop)
- No Ruby, Jekyll, or Bundler required on host

**Gems (installed in Docker):**

- From Story 1.1's `Gemfile`
- `jekyll`
- `al-folio` theme
- `jekyll-seo-tag`
- etc.

### Relationship to Other Stories

- **Depends On:** Story 1.1 (Jekyll site + Gemfile)
- **Enables:** Story 1.3 (GitHub Actions uses similar config)
- **Unblocks:** Development of all other stories (1.3, 1.4, Epics 2-5)

---

## Architecture Compliance

### al-folio Theme Compatibility

**al-folio + Docker:**

- ✅ No special Docker configuration needed for al-folio
- ✅ al-folio respects Jekyll standard paths
- ✅ LiveReload works with al-folio's built-in watch

**Theme Layouts Path:**

- When al-folio is a gem/remote theme, layouts come from gem
- When al-folio is cloned locally, layouts override gem versions
- Docker volume mount captures both scenarios

### Jekyll Conventions Maintained

- Working directory `/site` matches standard Jekyll setup
- Port `4000` is Jekyll default (no conflicts)
- `Gemfile.lock` ensures reproducibility
- Environment variables follow Jekyll conventions

### Production Parity

**Development (Docker):**

- Ruby 3.2 (matches production GitHub Actions)
- Same Gemfile/Gemfile.lock (from Story 1.1)
- Same Jekyll configuration (`_config.yml`)
- JEKYLL_ENV variable properly scoped

**Production (GitHub Pages - Story 1.3):**

- Ruby version configured in actions workflow
- Same Gemfile/Gemfile.lock frozen
- Same `_config.yml`
- JEKYLL_ENV=production for production builds

---

## Dev Agent Record

### Work Completed

✅ **Story 1.2: Configure Docker Development Environment**

**Deliverables:**

- [ ] `Dockerfile` created for Jekyll service
- [ ] `docker-compose.yml` created for service orchestration
- [ ] `.dockerignore` created to optimize build
- [ ] Docker image builds successfully
- [ ] Container starts with `docker-compose up`
- [ ] Site accessible at `localhost:4000`
- [ ] Live reload working (changes auto-refresh browser)
- [ ] Environment variables properly configured
- [ ] README updated with Docker setup instructions

**Validation Checklist:**

- [ ] All Acceptance Criteria verified
- [ ] `docker-compose up` runs without errors
- [ ] Jekyll rebuild triggers within 5 seconds of file change
- [ ] Browser auto-refresh works (or manual refresh shows changes)
- [ ] Environment variables match production settings

**Developer Notes:**

- First time build takes 2-3 minutes (downloading Ruby image + gems)
- Subsequent builds are faster (~30 seconds)
- Kill container with `ctrl-c`, restart with `docker-compose up`
- Clean rebuild: `docker-compose build --no-cache && docker-compose up`
- View container logs: `docker-compose logs -f jekyll`

**Troubleshooting Guide:**

| Problem | Solution |
|---------|----------|
| Port 4000 already in use | Kill other process: `lsof -i :4000` or change port in `docker-compose.yml` |
| Gems not updating | Run `docker-compose build --no-cache` to rebuild |
| Changes not reflecting | Check container logs: `docker-compose logs -f jekyll` |
| Browser not auto-reloading | Manually refresh (F5), check if LiveReload port 35729 is accessible |
| Docker daemon not running | Start Docker Desktop or Docker Engine |

**Success Indicators:**

- `docker-compose up` completes without errors
- Browser loads localhost:4000 without 404s
- Container console shows Jekyll rebuild messages on file save
- Browser auto-refreshes within 5 seconds of file save
- No missing assets (CSS/JS) in browser

---

## References & Research Notes

### Docker + Jekyll Resources

- **Jekyll Docker Setup:** <https://jekyllrb.com/docs/installation/docker/>
- **Docker Compose Official Docs:** <https://docs.docker.com/compose/>
- **Ruby Alpine Image:** <https://hub.docker.com/_/ruby>
- **LiveReload Plugin:** <https://github.com/RobertDeRose/jekyll-livereload>

### Next Story Context

**Story 1.3 (GitHub Actions) will use:**

- Similar Docker/Ruby configuration
- Same `_config.yml` and `Gemfile`
- JEKYLL_ENV=production for production builds
- Automatic deployment trigger on push to main

### Learning Moments for Dev Agent

**Docker Basics for this Project:**

- Docker containers are lightweight, isolated environments
- docker-compose orchestrates multiple services (we have 1 for now)
- Volume mounts enable live code editing inside containers
- Environment variables control Jekyll behavior (dev vs production)

**Jekyll + Docker Patterns:**

- Always use `Gemfile.lock` for reproducibility
- Use `--host 0.0.0.0` to expose Jekyll outside container
- LiveReload helps catch errors immediately during development
- `JEKYLL_ENV` variable changes build behavior

---

## Next Steps

Upon **completion** of this story:

1. **Verification by SM:** Confirm story acceptance criteria met
2. **Update Sprint Status:** Change story status to `done`, proceed to 1.3
3. **Update Epic Status:** Remains `in-progress`
4. **Developer Context:** Pass docker-compose knowledge to Story 1.3 (GitHub Actions workflow)

**Expected Impact:**

- All future stories developed with `docker-compose up` environment
- No dependency on local Ruby/Jekyll installation
- Consistent environment across all developers
- Foundation for continuous integration (Story 1.3)

**Estimated Timeline:**

- Create files: ~15 minutes
- First Docker build: ~2-3 minutes
- Testing & verification: ~15 minutes
- Total: ~30-35 minutes
