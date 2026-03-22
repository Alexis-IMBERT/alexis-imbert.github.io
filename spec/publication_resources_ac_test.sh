#!/bin/bash
# Description: Verifies the publication resources block for AC 1-7 in Story 3.4

SITE_DIR="_site"
FULL_PUB="${SITE_DIR}/publications/sample-publication/index.html"
PARTIAL_PUB="${SITE_DIR}/publications/partial-publication/index.html"

# Run bundle exec jekyll build to make sure site is up to date
echo "Building the site to ensure publications are generated..."
bundle exec jekyll build > /dev/null

echo "Starting publication_resources_ac_test..."
FAILED=0

# Positive testing on full publication
if [ ! -f "$FULL_PUB" ]; then
    echo "❌ Error: $FULL_PUB not found. Something is wrong with the Jekyll build."
    FAILED=1
else
    # AC 1: PDF Link
    if ! grep -q 'href="/assets/pdf/sample-publication.pdf"' "$FULL_PUB" || ! grep -q 'download' "$FULL_PUB"; then
         echo "❌ AC 1 Failed: PDF download link is missing or incorrect."
         FAILED=1
    else
         echo "✅ AC 1 Passed: PDF download link is present."
    fi

    # AC 2: HAL Link
    if ! grep -q 'href="https://hal.science/hal-00000001"' "$FULL_PUB" || ! grep -q 'target="_blank"' "$FULL_PUB"; then
         echo "❌ AC 2 Failed: HAL link is missing or incorrect."
         FAILED=1
    else
         echo "✅ AC 2 Passed: HAL link is present."
    fi

    # AC 3: DOI Link (normalization)
    if ! grep -q 'href="https://doi.org/10.1234/jair.2026.001"' "$FULL_PUB"; then
         echo "❌ AC 3 Failed: DOI normalisation link is missing or incorrect."
         FAILED=1
    else
         echo "✅ AC 3 Passed: DOI link is present and correctly normalized."
    fi

    # AC 4 & 6: BibTeX 
    if ! grep -q '<summary class="btn btn-bibtex">Show BibTeX</summary>' "$FULL_PUB" || ! grep -q '@article{imbert2026llm' "$FULL_PUB"; then
         echo "❌ AC 4/6 Failed: BibTeX toggle block is missing or missing content."
         FAILED=1
    else
         echo "✅ AC 4/6 Passed: BibTeX content is securely rendered."
    fi

    # AC 5: Interactive copy button
    if ! grep -q 'class="copy-bibtex-btn"' "$FULL_PUB"; then
         echo "❌ AC 5 Failed: Interactive copy button not found in BibTeX section."
         FAILED=1
    else
         echo "✅ AC 5 Passed: BibTeX copy interaction enabled."
    fi
fi

# Negative testing on partial publication
if [ ! -f "$PARTIAL_PUB" ]; then
    echo "❌ Error: $PARTIAL_PUB not found."
    FAILED=1
else
    if grep -q '<section class="resources"' "$PARTIAL_PUB"; then
         echo "❌ AC 7 Failed: Resources section rendered unnecessarily."
         FAILED=1
    else
         echo "✅ AC 7 Passed: Resources section gracefully hidden when empty."
    fi
fi

if [ $FAILED -ne 0 ]; then
    echo "❌ Some publication resources tests failed."
    exit 1
else
    echo "✅ All publication resources tests passed!"
    exit 0
fi
