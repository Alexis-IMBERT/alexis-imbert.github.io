#!/bin/bash

# Test for Story 5.2 - Content Management Projects Guide
# AC1: I see step-by-step instructions for creating a project file
# AC2: I see the required frontmatter fields explained
# AC3: I see an example project file with image handling

set -e

GUIDE_FILE="CONTENT_MANAGEMENT.md"
PROJECTS_DATA_FILE="_data/projects.yml"

if [ ! -f "$GUIDE_FILE" ]; then
    echo "ERROR: $GUIDE_FILE does not exist"
    exit 1
fi

if [ ! -f "$PROJECTS_DATA_FILE" ]; then
    echo "ERROR: $PROJECTS_DATA_FILE does not exist"
    exit 1
fi

echo "Testing AC1: step-by-step instructions..."
if ! grep -qi "1. Create a New File" "$GUIDE_FILE"; then
    echo "FAILED: Missing step for creating a file"
    exit 1
fi
for step in "2. Add Project Images" "3. Keep Frontmatter Minimal" "4. Add Project Metadata in" "5. Write the Content" "6. Preview Locally"; do
    if ! grep -qi "$step" "$GUIDE_FILE"; then
        echo "FAILED: Missing step section: $step"
        exit 1
    fi
done
if ! grep -qi "_TEMPLATE.md" "$GUIDE_FILE"; then
    echo "FAILED: Missing mention of _TEMPLATE.md"
    exit 1
fi

echo "Testing AC2: required frontmatter fields explained..."
for field in title; do
    if ! grep -q "\`$field\`" "$GUIDE_FILE"; then
        echo "FAILED: Missing explanation for minimal frontmatter field: $field"
        exit 1
    fi
done

for field in description image technologies github_url demo_url; do
    if ! grep -q "\`$field\`" "$GUIDE_FILE"; then
        echo "FAILED: Missing explanation for metadata field: $field"
        exit 1
    fi
done

if ! grep -q "_data/projects.yml" "$GUIDE_FILE"; then
    echo "FAILED: Missing mention of _data/projects.yml"
    exit 1
fi

echo "Testing AC3: example project file with image handling..."
if ! grep -q "\`assets/images/" "$GUIDE_FILE"; then
    echo "FAILED: Missing explanation for image handling in assets/images/"
    exit 1
fi
if ! grep -q 'image: "/assets/images/' "$GUIDE_FILE"; then
    echo "FAILED: Missing image frontmatter example using /assets/images/"
    exit 1
fi
if ! grep -qi "Full Example" "$GUIDE_FILE"; then
    echo "FAILED: Missing Example project file"
    exit 1
fi

if ! grep -qi "docker-compose up" "$GUIDE_FILE"; then
    echo "FAILED: Missing mention of docker-compose"
    exit 1
fi

echo "All Story 5.2 tests passed!"
exit 0
