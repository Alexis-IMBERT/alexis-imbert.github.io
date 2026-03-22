#!/bin/bash
# about_ac_test.sh
# Acceptance tests for About / CV Page (Stories 2.1 and 2.2)

echo "Running Acceptance Tests for About / CV Page..."

# AC1: See academic background
echo "Checking for Academic Background section..."
if grep -q "Academic Background" about.md; then
  echo "✅ AC1 passed."
else
  echo "❌ AC1 failed."
  exit 1
fi

# AC2: See professional experiences
echo "Checking for Professional Experience section..."
if grep -q "Professional Experience" about.md; then
  echo "✅ AC2 passed."
else
  echo "❌ AC2 failed."
  exit 1
fi

# AC3: Structured semantic HTML
echo "Checking for semantic heading usage (Markdown)..."
if grep -q "^## " about.md; then
  echo "✅ AC3 passed."
else
  echo "❌ AC3 failed."
  exit 1
fi

# AC4: Navigation access
echo "Checking _config.yml for About / CV navigation link..."
if grep -q "title: \"About / CV\"" _config.yml && grep -q "href: \"/about/\"" _config.yml; then
  echo "✅ AC4 passed."
else
  echo "❌ AC4 failed."
  exit 1
fi

# Story 2.2 AC1: Skills grouped by categories
echo "Checking for Technical Skills section and category loop..."
if grep -q "## Technical Skills" about.md && grep -q "site.data.skills.categories" about.md; then
  echo "✅ Story 2.2 AC1 passed."
else
  echo "❌ Story 2.2 AC1 failed."
  exit 1
fi

# Story 2.2 AC2: Skills are clearly labeled
echo "Checking skills labels and list structure..."
if grep -q "<h3>{{ category.name }}</h3>" about.md && grep -q "<li>{{ item }}</li>" about.md; then
  echo "✅ Story 2.2 AC2 passed."
else
  echo "❌ Story 2.2 AC2 failed."
  exit 1
fi

echo "Checking data source categories in _data/skills.yml..."
if grep -q "name: \"Programming\"" _data/skills.yml && grep -q "name: \"Machine Learning / Deep Learning\"" _data/skills.yml && grep -q "name: \"Tools\"" _data/skills.yml; then
  echo "✅ Story 2.2 data labels passed."
else
  echo "❌ Story 2.2 data labels failed."
  exit 1
fi

# Story 2.2 AC3: Mobile readability without horizontal scroll
echo "Checking responsive skills layout rules..."
if grep -q "grid-template-columns: 1fr;" _layouts/default.html \
  && grep -q "overflow-wrap: anywhere;" _layouts/default.html \
  && grep -q "word-break: break-word;" _layouts/default.html; then
  echo "✅ Story 2.2 AC3 passed."
else
  echo "❌ Story 2.2 AC3 failed."
  exit 1
fi

echo "Checking that About page does not override global responsive safeguards..."
if grep -q "<style>" about.md || grep -q "skills-section {" about.md; then
  echo "❌ Story 2.2 style centralization failed (inline overrides detected)."
  exit 1
else
  echo "✅ Story 2.2 style centralization passed."
fi

echo "All About / CV + Skills Acceptance Criteria tests passed! 🎉"
exit 0
