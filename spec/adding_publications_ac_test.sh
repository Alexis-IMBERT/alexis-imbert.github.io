#!/bin/bash

# Test for Story 5.1 - Adding Publications Guide
# AC1: step-by-step instructions for creating a publication file
# AC2: required frontmatter fields explained
# AC3: example publication file provided
# AC4/NFR12: documentation includes a <= 10 minutes path

set -e

GUIDE_FILE="docs/adding-publications.md"
TEMPLATE_FILE="_publications/_TEMPLATE.md"

if [ ! -f "$GUIDE_FILE" ]; then
    echo "ERROR: $GUIDE_FILE does not exist"
    exit 1
fi

if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "ERROR: $TEMPLATE_FILE does not exist"
    exit 1
fi

echo "Testing AC1: step-by-step instructions..."
if ! grep -qi "Step-by-Step Instructions" "$GUIDE_FILE"; then
    echo "FAILED: Missing step-by-step section"
    exit 1
fi
if ! grep -q "_TEMPLATE.md" "$GUIDE_FILE"; then
    echo "FAILED: Missing mention of _TEMPLATE.md duplication"
    exit 1
fi

echo "Testing AC2: required frontmatter fields explained..."
for field in title date authors venue; do
    if ! grep -q "\`$field\`: \*\*Required\*\*" "$GUIDE_FILE"; then
        echo "FAILED: Missing required explanation for field: $field"
        exit 1
    fi
done

for field in pdf hal doi bibtex slides video code; do
    if ! grep -q "\`$field\`: \*\*Optional\*\*" "$GUIDE_FILE"; then
        echo "FAILED: Missing optional explanation for field: $field"
        exit 1
    fi
done

echo "Testing AC3: example publication file..."
if ! grep -qi "## Example File" "$GUIDE_FILE"; then
    echo "FAILED: Missing example file section"
    exit 1
fi
if ! grep -q "layout: publication" "$GUIDE_FILE"; then
    echo "FAILED: Missing publication layout in example"
    exit 1
fi

echo "Testing AC4/NFR12: under 10 minutes guidance..."
if ! grep -qi "Under 10 Minutes" "$GUIDE_FILE"; then
    echo "FAILED: Missing quick path section"
    exit 1
fi
if ! grep -q "Total target: 10 minutes" "$GUIDE_FILE"; then
    echo "FAILED: Missing explicit 10-minute target"
    exit 1
fi

echo "Testing template alignment with guide..."
if ! grep -q "authors:" "$TEMPLATE_FILE"; then
    echo "FAILED: Template authors field is not a list"
    exit 1
fi
if grep -q "demo:" "$GUIDE_FILE"; then
    echo "FAILED: Guide includes unsupported field: demo"
    exit 1
fi

echo "All Story 5.1 tests passed!"
exit 0
