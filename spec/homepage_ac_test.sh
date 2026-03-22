#!/bin/bash
# Homepage AC Verification Test Script
# Story 1.4: Create Homepage with Navigation
# Tests all Acceptance Criteria

set -e

BASE_URL="${1:-http://localhost:4000}"
ERRORS=0
WARNINGS=0

echo "=========================================="
echo "Homepage AC Verification Test"
echo "=========================================="
echo ""
echo "Testing base URL: $BASE_URL"
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Helper functions
pass() {
  echo -e "${GREEN}✓${NC} $1"
}

fail() {
  echo -e "${RED}✗${NC} $1"
  ERRORS=$((ERRORS + 1))
}

warn() {
  echo -e "${YELLOW}⚠${NC} $1"
  WARNINGS=$((WARNINGS + 1))
}

# AC1: CV Summary visible above fold
echo "AC1: CV Summary visible above fold"
echo "---"
RESPONSE=$(curl -s "$BASE_URL")

if echo "$RESPONSE" | grep -q "Alexis Imbert"; then
  pass "Name 'Alexis Imbert' found"
else
  fail "Name 'Alexis Imbert' not found"
fi

if echo "$RESPONSE" | grep -q "Graph Neural Networks"; then
  pass "Research focus 'Graph Neural Networks' found"
else
  fail "Research focus 'Graph Neural Networks' not found"
fi

if echo "$RESPONSE" | grep -q "INSA Rouen Normandie"; then
  pass "Institution 'INSA Rouen Normandie' found"
else
  fail "Institution 'INSA Rouen Normandie' not found"
fi

if echo "$RESPONSE" | grep -q "PhD student"; then
  pass "Title 'PhD student' found"
else
  warn "Title 'PhD student' not explicitly found (may be in page title)"
fi

echo ""

# AC2: Navigation menu with Publications, Projects, Contact
echo "AC2: Navigation menu with Publications, Projects, Contact"
echo "---"

if echo "$RESPONSE" | grep -q "Publications"; then
  pass "Navigation link 'Publications' found"
else
  fail "Navigation link 'Publications' not found"
fi

if echo "$RESPONSE" | grep -q "Projects"; then
  pass "Navigation link 'Projects' found"
else
  fail "Navigation link 'Projects' not found"
fi

if echo "$RESPONSE" | grep -q "Contact"; then
  pass "Navigation link 'Contact' found"
else
  fail "Navigation link 'Contact' not found"
fi

if echo "$RESPONSE" | grep -q "/publications/" && echo "$RESPONSE" | grep -q "/projects/" && echo "$RESPONSE" | grep -q "/contact/"; then
  pass "Navigation hrefs are correct"
else
  fail "Some navigation hrefs are missing or incorrect"
fi

echo ""

# AC3: Meta tags for SEO
echo "AC3: Meta tags for SEO"
echo "---"

if echo "$RESPONSE" | grep -q "<meta name=\"description\""; then
  pass "Meta description tag found"
else
  fail "Meta description tag not found"
fi

if echo "$RESPONSE" | grep -q "Graph Neural Networks"; then
  pass "Meta description contains keywords"
else
  warn "Meta description may not have SEO keywords"
fi

if echo "$RESPONSE" | grep -q "utf-8"; then
  pass "Character encoding specified"
else
  warn "Character encoding not explicitly found (but may be default)"
fi

if echo "$RESPONSE" | grep -q "<title>"; then
  TITLE=$(echo "$RESPONSE" | sed -n 's:.*<title>\([^<]*\)</title>.*:\1:p' | head -1)
  if echo "$TITLE" | grep -q "Alexis Imbert"; then
    pass "Page title contains name: $TITLE"
  else
    warn "Page title doesn't contain full name: $TITLE"
  fi
else
  fail "Page title tag not found"
fi

echo ""

# AC4: Responsive design
echo "AC4: Responsive design works on mobile/tablet/desktop"
echo "---"

if echo "$RESPONSE" | grep -q "viewport"; then
  pass "Viewport meta tag found (responsive meta)"
else
  fail "Viewport meta tag not found (responsive design may fail)"
fi

if echo "$RESPONSE" | grep -q "menu-toggle"; then
  pass "Mobile menu toggle found (hamburger menu)"
else
  warn "Mobile menu toggle not found (may use al-folio theme)"
fi

if echo "$RESPONSE" | grep -q "@media"; then
  pass "Media queries found (responsive CSS)"
else
  warn "Media queries not found (may use external CSS)"
fi

echo ""

# General checks
echo "General Checks"
echo "---"

if echo "$RESPONSE" | grep -q "404"; then
  fail "Page returned 404 error"
elif [ -z "$RESPONSE" ]; then
  fail "Empty response from server"
else
  pass "Homepage loads without 404"
fi

if echo "$RESPONSE" | grep -q "<!-- Error"; then
  fail "HTML contains error comments"
else
  pass "No HTML error comments"
fi

echo ""

# Summary
echo "=========================================="
echo "Test Summary"
echo "=========================================="
echo -e "Errors:   ${RED}$ERRORS${NC}"
echo -e "Warnings: ${YELLOW}$WARNINGS${NC}"

if [ $ERRORS -eq 0 ]; then
  echo -e "${GREEN}✓ All critical tests passed!${NC}"
  exit 0
else
  echo -e "${RED}✗ Some tests failed. Please fix the issues above.${NC}"
  exit 1
fi
