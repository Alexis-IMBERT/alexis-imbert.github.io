#!/bin/bash
# AC Tests for Story 4.1: Setup Projects Collection

# Setup environment
JEKYLL_CONFIG="_config.yml"
COLLECTION_DIR="_projects"
LAYOUT_FILE="_layouts/project.html"
TEMPLATE_FILE="_projects/_TEMPLATE.md"

echo "Running AC tests for Story 4.1..."

# AC1: Collection configured
echo "Testing AC1..."
if grep -q "projects:" $JEKYLL_CONFIG && grep -q "output: true" $JEKYLL_CONFIG; then
    echo "✅ AC1 Pass: Collection configured with output true."
else
    echo "❌ AC1 Fail: Collection missing or incorrectly configured in $JEKYLL_CONFIG."
    exit 1
fi

# AC2: Default Layout mapped and layout file exists
echo "Testing AC2..."
if grep -A 5 "type: \"projects\"" $JEKYLL_CONFIG | grep -q "layout: \"project\""; then
    if [ -f "$LAYOUT_FILE" ]; then
        echo "✅ AC2 Pass: Default layout mapped correctly for projects and layout file exists."
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
    if grep -q "title:" "$TEMPLATE_FILE" && grep -q "description:" "$TEMPLATE_FILE" && grep -q "technologies:" "$TEMPLATE_FILE" && grep -q "github_url:" "$TEMPLATE_FILE" && grep -q "demo_url:" "$TEMPLATE_FILE" && grep -q "image:" "$TEMPLATE_FILE"; then
        echo "✅ AC3 Pass: Schema defined with all required frontmatter in $TEMPLATE_FILE."
    else
        echo "❌ AC3 Fail: Scheme template missing some required frontmatter fields."
        exit 1
    fi
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

echo "🎉 All AC tests for Story 4.1 passed successfully!"
exit 0
