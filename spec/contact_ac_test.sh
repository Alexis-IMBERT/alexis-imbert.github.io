#!/bin/bash
# Contact Page AC Verification Test Script
# Story 2.5: Add Contact Information
# Tests all Acceptance Criteria

set -e

# Default to the built site directory if Base URL is not provided
SITE_DIR="_site"
CONTACT_PAGE="${SITE_DIR}/contact/index.html"
CONTACT_MD="contact.md"
CONFIG_FILE="_config.yml"

ERRORS=0

echo "=========================================="
echo "Contact Page AC Verification Test"
echo "=========================================="
echo ""

# Helper for reporting
fail() {
    echo -e "❌ $1"
    ERRORS=$((ERRORS+1))
}
pass() {
    echo -e "✅ $1"
}

# Verify built page exists
if [ ! -f "$CONTACT_PAGE" ]; then
    fail "Contact page not found at $CONTACT_PAGE (Ensure Jekyll is built before running tests locally)"
else
    # AC1: mailto: link presence
    if grep -q "mailto:" "$CONTACT_PAGE"; then
        pass "AC1: 'mailto:' link is present on the contact page."
    else
        fail "AC1: 'mailto:' link NOT found on the contact page."
    fi

    # AC3: no form element
    if grep -qi "<form" "$CONTACT_PAGE"; then
        fail "AC3: A <form> element was found on the contact page. Contact should not use forms."
    else
        pass "AC3: No <form> tags identified."
    fi
fi

# Check markdown file configuration
if [ ! -f "$CONTACT_MD" ]; then
    fail "contact.md source file not found."
else
    if grep -q 'permalink: /contact/' "$CONTACT_MD"; then
        pass "contact.md has correct permalink."
    else
        fail "contact.md missing 'permalink: /contact/'"
    fi
fi

# AC1: expected configured email is present in mailto
EXPECTED_EMAIL=""
if [ -f "$CONFIG_FILE" ]; then
    EXPECTED_EMAIL=$(awk -F': *' '/^email:/ {print $2; exit}' "$CONFIG_FILE" | tr -d '"')

    if [ -z "$EXPECTED_EMAIL" ]; then
        EXPECTED_EMAIL=$(awk '
            /^author:/ {in_author=1; next}
            in_author && /^[^[:space:]]/ {in_author=0}
            in_author && /^[[:space:]]+email:/ {
                sub(/^[[:space:]]+email:[[:space:]]*/, "", $0)
                gsub(/"/, "", $0)
                print $0
                exit
            }
        ' "$CONFIG_FILE")
    fi
fi

if [ -n "$EXPECTED_EMAIL" ]; then
    if grep -q "mailto:${EXPECTED_EMAIL}" "$CONTACT_PAGE"; then
        pass "AC1: contact mailto includes configured email (${EXPECTED_EMAIL})."
    else
        fail "AC1: contact mailto does not include configured email (${EXPECTED_EMAIL})."
    fi
else
    fail "AC1: could not resolve expected email from ${CONFIG_FILE}."
fi

# AC2: contact discoverability from homepage
HOMEPAGE_FILE="${SITE_DIR}/index.html"
if [ -f "$HOMEPAGE_FILE" ]; then
    if grep -q '/contact/' "$HOMEPAGE_FILE"; then
        pass "AC2: homepage contains a Contact entry point."
    else
        fail "AC2: homepage missing Contact entry point."
    fi
else
    fail "AC2: homepage file not found at ${HOMEPAGE_FILE}."
fi

if [ $ERRORS -gt 0 ]; then
    echo "=========================================="
    echo "Failure: $ERRORS test(s) failed."
    exit 1
else
    echo "=========================================="
    echo "Success: All Contact Page tests passed!"
    exit 0
fi
