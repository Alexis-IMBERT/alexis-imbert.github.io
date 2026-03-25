#!/bin/bash
set -e

echo "Testing Editing Content documentation..."
DOC_FILE="docs/editing-content.md"
[ -f "$DOC_FILE" ] || { echo "ERROR: File not found"; exit 1; }
README_FILE="README.md"
[ -f "$README_FILE" ] || { echo "ERROR: README.md not found"; exit 1; }

echo "Checking AC3: Markdown editing instructions exist..."
grep -q "## 1. Modifying Markdown Files" "$DOC_FILE" || { echo "FAILED: Missing markdown modification section"; exit 1; }
grep -q "_publications/" "$DOC_FILE" || { echo "FAILED: Missing _publications reference"; exit 1; }
grep -q "_projects/" "$DOC_FILE" || { echo "FAILED: Missing _projects reference"; exit 1; }

echo "Checking AC4: frontmatter vs content explanation exists..."
grep -q "## 2. Understanding Frontmatter vs. Content" "$DOC_FILE" || { echo "FAILED: Missing frontmatter/content section"; exit 1; }
grep -q "YAML Frontmatter" "$DOC_FILE" || { echo "FAILED: Missing YAML frontmatter explanation"; exit 1; }
grep -q "Body Content" "$DOC_FILE" || { echo "FAILED: Missing body content explanation"; exit 1; }

echo "Checking AC5: local preview instructions are correct..."
grep -q "## 3. Previewing Changes Locally" "$DOC_FILE" || { echo "FAILED: Missing local preview section"; exit 1; }
grep -q "docker compose up" "$DOC_FILE" || { echo "FAILED: Missing docker preview command"; exit 1; }
grep -q "http://localhost:4000" "$DOC_FILE" || { echo "FAILED: Missing correct local preview URL"; exit 1; }
! grep -q "localhost:8080" "$DOC_FILE" || { echo "FAILED: Unexpected localhost:8080 reference"; exit 1; }

echo "Checking discoverability from README..."
grep -Eq "\[[^]]+\]\(docs/editing-content\.md\)" "$README_FILE" || { echo "FAILED: README does not link to editing guide"; exit 1; }

echo "Success!"
