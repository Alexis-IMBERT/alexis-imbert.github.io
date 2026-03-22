#!/bin/bash

# Configuration
SITE_DIR="_site"
TEST_SLUG="sample-publication"
TEST_FILE="$SITE_DIR/publications/$TEST_SLUG/index.html"
EXIT_CODE=0

echo "Running Acceptance Tests for Publication Detail Page Template (Story 3.3)"
echo "----------------------------------------------------------------------"

# Check if the site is built
if [ ! -d "$SITE_DIR" ]; then
    echo "❌ Error: $SITE_DIR does not exist. Run 'bundle exec jekyll build' first."
    exit 1
fi

# Run build if test file doesn't exist
if [ ! -f "$TEST_FILE" ]; then
    echo "Building site to ensure publications are generated..."
    bundle exec jekyll build
fi

# Assertion helper
assert_contains() {
    local search_term="$1"
    local file="$2"
    local error_msg="$3"
    
    if grep -q "$search_term" "$file"; then
        echo "✅ Passed: Found '$search_term'"
        return 0
    else
        echo "❌ Failed: $error_msg"
        EXIT_CODE=1
        return 1
    fi
}

echo "Testing URL Behavior (AC: 3) & Detail Page Discoverability..."
if [ -f "$TEST_FILE" ]; then
    echo "✅ Passed: Generated detail page exists at /publications/$TEST_SLUG/"
else
    echo "❌ Failed: Detail page not found at $TEST_FILE"
    EXIT_CODE=1
    exit $EXIT_CODE
fi

echo -e "\nTesting Full Information Rendering (AC: 1)..."
assert_contains "class=\"publication-title\"" "$TEST_FILE" "Missing title semantic class"
assert_contains "class=\"authors\"" "$TEST_FILE" "Missing authors semantic class"
assert_contains "class=\"venue\"" "$TEST_FILE" "Missing venue semantic class"
assert_contains "class=\"date\"" "$TEST_FILE" "Missing date semantic class"
assert_contains "class=\"abstract\"" "$TEST_FILE" "Missing abstract semantic class"

echo -e "\nTesting Semantic HTML Structure (AC: 2)..."
assert_contains "<article class=\"publication\">" "$TEST_FILE" "Missing semantic <article> tag"
assert_contains "<header class=\"publication-header\">" "$TEST_FILE" "Missing semantic <header> tag"
assert_contains "<section class=\"abstract\"" "$TEST_FILE" "Missing semantic <section> for abstract"

echo -e "\nTesting Scholar-oriented Metadata (AC: 4)..."
assert_contains "<meta name=\"citation_title\"" "$TEST_FILE" "Missing citation_title meta tag"
assert_contains "<meta name=\"citation_author\"" "$TEST_FILE" "Missing citation_author meta tag"
assert_contains "<meta name=\"citation_publication_date\"" "$TEST_FILE" "Missing citation_publication_date meta tag"

echo "----------------------------------------------------------------------"
if [ $EXIT_CODE -eq 0 ]; then
    echo "🎉 All tests passed successfully!"
else
    echo "💥 Some tests failed."
fi

exit $EXIT_CODE
