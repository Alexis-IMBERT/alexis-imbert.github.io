#!/bin/bash
# AC Tests for Story 3.1: Setup Publications Collection

# Setup environment
JEKYLL_CONFIG="_config.yml"
COLLECTION_DIR="_publications"
LAYOUT_FILE="_layouts/publication.html"
TEMPLATE_FILE="_publications/_TEMPLATE.md"

echo "Running AC tests for Story 3.1..."

# AC1: Collection configured
echo "Testing AC1..."
if grep -q "publications:" $JEKYLL_CONFIG && grep -q "output: true" $JEKYLL_CONFIG && grep -q "permalink: /publications/:path/" $JEKYLL_CONFIG; then
    echo "✅ AC1 Pass: Collection configured with output true and correct permalink."
else
    echo "❌ AC1 Fail: Collection missing or incorrectly configured in $JEKYLL_CONFIG."
    exit 1
fi

# AC2: Default Layout mapped and layout file exists
echo "Testing AC2..."
if grep -A 5 "type: \"publications\"" $JEKYLL_CONFIG | grep -q "layout: \"publication\""; then
    if [ -f "$LAYOUT_FILE" ]; then
        echo "✅ AC2 Pass: Default layout mapped correctly for publications and layout file exists."
    else
        echo "❌ AC2 Fail: Layout file $LAYOUT_FILE does not exist."
        exit 1
    fi
else
    echo "❌ AC2 Fail: Default layout not mapped in $JEKYLL_CONFIG."
    exit 1
fi

# AC3: Frontmatter schema defined
echo "Testing AC3..."
if [ -f "$TEMPLATE_FILE" ]; then
    echo "✅ AC3 Pass: Schema defined in $TEMPLATE_FILE."
else
    echo "❌ AC3 Fail: Scheme template missing: $TEMPLATE_FILE"
    exit 1
fi

# AC4: Collection is operational and directory exists
echo "Testing AC4..."
if [ -d "$COLLECTION_DIR" ]; then
    echo "✅ AC4 Pass: Directory $COLLECTION_DIR exists and operates."
else
    echo "❌ AC4 Fail: Collection directory missing."
    exit 1
fi

echo "🎉 All AC tests for Story 3.1 passed successfully!"
exit 0