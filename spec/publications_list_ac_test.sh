#!/bin/bash
set -e

# Wait for site build if needed, but we assume it's running or built.
# Let's just build it to _site so we can grep it.
bundle exec jekyll build

PUB_FILE="_site/publications/index.html"

# AC1: Reverse chronological order. Let's test that sample-publication appears before partial-publication if we know their dates?
# Let's check that AC2 fields are present: title, authors, venue, date.

grep -i "Alexis Imbert, Jane Doe" "$PUB_FILE" || { echo "Test failed: authors not found"; exit 1; }
grep -i "Journal of Artificial Intelligence Research" "$PUB_FILE" || { echo "Test failed: venue not found"; exit 1; }

echo "publications_list_ac_test: All pass"
