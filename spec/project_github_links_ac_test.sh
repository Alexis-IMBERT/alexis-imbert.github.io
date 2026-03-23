#!/bin/bash
# AC tests for Story 4.4: Add GitHub Repository Links

# Ensure we're in the right directory
cd "$(dirname "$0")/.."

# Build jekyll
echo "Building Jekyll site..."
bundle exec jekyll build

GITHUB_PROJECT_HTML="_site/projects/github-project/index.html"
NO_GITHUB_PROJECT_HTML="_site/projects/sample-project/index.html"

if [ ! -f "$GITHUB_PROJECT_HTML" ]; then
  echo "Error: project detail page not generated at $GITHUB_PROJECT_HTML"
  exit 1
fi

if [ ! -f "$NO_GITHUB_PROJECT_HTML" ]; then
  echo "Error: project detail page not generated at $NO_GITHUB_PROJECT_HTML"
  exit 1
fi

echo "Testing Story 4.4 ACs..."

# AC 3 & 4: "View on GitHub" button with external link behavior in project WITH github_url
if grep -q "href=\"https://github.com/abc/def\"" "$GITHUB_PROJECT_HTML" && \
   grep -q 'class="btn btn-primary"' "$GITHUB_PROJECT_HTML" && \
   grep -q "View on GitHub" "$GITHUB_PROJECT_HTML" && \
   grep -q 'target="_blank"' "$GITHUB_PROJECT_HTML" && \
   grep -q 'rel="noopener noreferrer"' "$GITHUB_PROJECT_HTML"; then
  echo "✅ AC 3/4: GitHub button displayed with proper external link attributes"
else
  echo "❌ AC 3/4 Failed: GitHub button missing or incorrect link attributes"
  exit 1
fi

# AC 5: Button is not displayed for projects WITHOUT github_url
if grep -q "View on GitHub" "$NO_GITHUB_PROJECT_HTML"; then
  echo "❌ AC 5 Failed: GitHub button is displayed when github_url is missing"
  exit 1
else
  echo "✅ AC 5: GitHub button successfully hidden when github_url is missing"
fi

echo "All ACs passed for Story 4.4!"
exit 0
