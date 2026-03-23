#!/bin/bash
set -e

echo "Testing Editing Content documentation..."
DOC_FILE="docs/editing-content.md"
[ -f "$DOC_FILE" ] || { echo "ERROR: File not found"; exit 1; }

echo "Success!"
