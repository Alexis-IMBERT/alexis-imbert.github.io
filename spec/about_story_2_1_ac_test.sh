#!/bin/bash
# about_story_2_1_ac_test.sh
# Acceptance tests for Story 2.1 only.

set -euo pipefail

echo "Running Story 2.1 acceptance tests..."

if [[ ! -f "about.md" ]]; then
  echo "FAIL: about.md is missing"
  exit 1
fi

if [[ ! -f "_config.yml" ]]; then
  echo "FAIL: _config.yml is missing"
  exit 1
fi

# AC1: academic background content exists
if grep -q "^## Academic Background" about.md && grep -q "PhD in Computer Science" about.md; then
  echo "PASS: AC1 academic background present"
else
  echo "FAIL: AC1 academic background missing"
  exit 1
fi

# AC2: professional experience content exists
if grep -q "^## Professional Experience" about.md && grep -q "PhD Researcher" about.md; then
  echo "PASS: AC2 professional experience present"
else
  echo "FAIL: AC2 professional experience missing"
  exit 1
fi

# AC3: semantic structure in source and generated HTML
if grep -q "^# About / CV" about.md && grep -q "^## Academic Background" about.md && grep -q "^## Professional Experience" about.md; then
  echo "PASS: AC3 semantic headings in Markdown"
else
  echo "FAIL: AC3 semantic headings missing in Markdown"
  exit 1
fi

# AC4: navigation entry configured
if grep -q 'title: "About / CV"' _config.yml && grep -q 'href: "/about/"' _config.yml; then
  echo "PASS: AC4 navigation entry in _config.yml"
else
  echo "FAIL: AC4 navigation entry missing in _config.yml"
  exit 1
fi

# Build and validate rendered HTML instead of source-only checks
bundle exec jekyll build --quiet

if [[ ! -f "_site/about/index.html" ]]; then
  echo "FAIL: generated page _site/about/index.html missing"
  exit 1
fi

if grep -q "Academic Background" _site/about/index.html && grep -q "Professional Experience" _site/about/index.html; then
  echo "PASS: generated About page contains AC content"
else
  echo "FAIL: generated About page missing AC content"
  exit 1
fi

if grep -q 'href="/about/"' _site/about/index.html && grep -q "About / CV" _site/about/index.html; then
  echo "PASS: generated navigation includes About / CV"
else
  echo "FAIL: generated navigation missing About / CV"
  exit 1
fi

echo "Story 2.1 acceptance tests passed."
