#!/bin/bash
# CV Download AC Verification Test Script
# Story 2.4: Add CV PDF Download Button
# Tests all Acceptance Criteria

set -e

BASE_URL="${1:-http://localhost:4000}"
SITE_FILE="_site/index.html"
SITE_PDF="_site/assets/CV_Alexis_IMBERT.pdf"
ERRORS=0
TMP_PDF="/tmp/cv_download_test_$$.pdf"

cleanup() {
  rm -f "$TMP_PDF"
}
trap cleanup EXIT

echo "=========================================="
echo "CV Download AC Verification Test"
echo "=========================================="
echo ""
echo "Testing base URL: $BASE_URL"
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Helper functions
pass() {
  echo -e "${GREEN}✓${NC} $1"
}

fail() {
  echo -e "${RED}✗${NC} $1"
  ERRORS=$((ERRORS + 1))
}

USE_HTTP=1
if ! curl -fsS "$BASE_URL" >/dev/null 2>&1; then
  USE_HTTP=0
  if [ ! -f "$SITE_FILE" ]; then
    fail "Preview server is not reachable at $BASE_URL and fallback file $SITE_FILE is missing"
    echo "Run a local preview or generate the site with 'bundle exec jekyll build' and re-run this test."
    echo "=========================================="
    echo -e "${RED}Failed with $ERRORS errors.${NC}"
    exit 1
  fi
fi

# AC1 & AC3: Target link exists on homepage
echo "AC1 & AC3: Checking homepage for CV Download link"
echo "---"
if [ "$USE_HTTP" -eq 1 ]; then
  RESPONSE=$(curl -s "$BASE_URL")
else
  RESPONSE=$(cat "$SITE_FILE")
fi

if echo "$RESPONSE" | grep -q 'href="/assets/CV_Alexis_IMBERT.pdf"'; then
  pass "Link to CV PDF found"
else
  fail "Link to CV PDF not found on homepage"
fi

if echo "$RESPONSE" | grep -q 'download="CV_Alexis_IMBERT.pdf"'; then
  pass "Download attribute found"
else
  fail "Download attribute not found on link"
fi

if echo "$RESPONSE" | grep -q 'Download CV (PDF)'; then
  pass "Link text 'Download CV (PDF)' found"
else
  fail "Link text 'Download CV (PDF)' not found"
fi

if echo "$RESPONSE" | grep -q 'class="btn btn-primary"'; then
  pass "Prominent CTA classes (btn btn-primary) found"
else
  fail "Prominent CTA classes missing"
fi

# AC1 & AC2: CV File exists and is accessible
echo ""
echo "AC1 & AC2: Checking CV PDF file access"
echo "---"
FILE_URL="$BASE_URL/assets/CV_Alexis_IMBERT.pdf"
if [ "$USE_HTTP" -eq 1 ]; then
  HTTP_STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" "$FILE_URL")

  if [ "$HTTP_STATUS" -eq 200 ]; then
    pass "PDF file accessible (HTTP 200)"
  else
    fail "PDF file not accessible (HTTP $HTTP_STATUS)"
  fi

  if curl -fsS "$FILE_URL" -o "$TMP_PDF"; then
    pass "PDF downloaded successfully"
  else
    fail "Could not download PDF file"
  fi
else
  if [ -f "$SITE_PDF" ]; then
    cp "$SITE_PDF" "$TMP_PDF"
    pass "PDF file accessible in generated site output"
  else
    fail "Generated site PDF not found at $SITE_PDF"
  fi
fi

if [ -s "$TMP_PDF" ] && head -c 4 "$TMP_PDF" | grep -q '%PDF'; then
  pass "Downloaded file has PDF signature"
else
  fail "Downloaded file is not a valid PDF signature"
fi

EXPECTED_SUM=$(shasum -a 256 assets/CV_Alexis_IMBERT.pdf | awk '{print $1}')
ACTUAL_SUM=$(shasum -a 256 "$TMP_PDF" | awk '{print $1}')

if [ "$EXPECTED_SUM" = "$ACTUAL_SUM" ]; then
  pass "Downloaded PDF matches repository CV file checksum"
else
  fail "Downloaded PDF differs from repository CV file"
fi

echo ""
echo "=========================================="
if [ $ERRORS -eq 0 ]; then
  echo -e "${GREEN}All checks passed successfully!${NC}"
  exit 0
else
  echo -e "${RED}Failed with $ERRORS errors.${NC}"
  exit 1
fi
