#!/bin/bash

# Story 5.5 acceptance checks for README overview and onboarding coverage.

set -euo pipefail

README_FILE="README.md"

if [ ! -f "$README_FILE" ]; then
  echo "FAILED: README.md not found"
  exit 1
fi

echo "AC1: project description and purpose"
if ! grep -qi "academic portfolio" "$README_FILE"; then
  echo "FAILED: missing clear project purpose/description"
  exit 1
fi

echo "AC2: local Docker setup instructions"
if ! grep -q "docker-compose up" "$README_FILE"; then
  echo "FAILED: missing docker compose run command"
  exit 1
fi
if ! grep -q "http://localhost:4000" "$README_FILE"; then
  echo "FAILED: missing local preview URL"
  exit 1
fi

echo "AC3: content management links/instructions"
if ! grep -q "_publications/_TEMPLATE.md" "$README_FILE"; then
  echo "FAILED: missing publication onboarding link"
  exit 1
fi
if ! grep -q "_projects/_TEMPLATE.md" "$README_FILE"; then
  echo "FAILED: missing project onboarding link"
  exit 1
fi
if ! grep -q "docs/editing-content.md" "$README_FILE"; then
  echo "FAILED: missing content editing guide link"
  exit 1
fi

echo "AC4: deployment and GitHub Pages workflow details"
if ! grep -qi "github actions" "$README_FILE"; then
  echo "FAILED: missing GitHub Actions mention"
  exit 1
fi
if ! grep -qi "github pages" "$README_FILE"; then
  echo "FAILED: missing GitHub Pages mention"
  exit 1
fi
if ! grep -q ".github/workflows/deploy.yml" "$README_FILE"; then
  echo "FAILED: missing workflow file reference"
  exit 1
fi

echo "AC5: repository code structure explanation"
for item in "_publications/" "_projects/" "_data/"; do
  if ! grep -q "$item" "$README_FILE"; then
    echo "FAILED: missing structure element $item"
    exit 1
  fi
done

echo "All Story 5.5 README acceptance checks passed."
