#!/bin/bash
# AC Test for Story 5.4 - Verify Docker Compose Local Preview

# AC1, AC3: Verify Dockerfile and docker-compose.yml configuration
if grep -q 'ruby:3.2' Dockerfile && grep -q '4000:4000' docker-compose.yml && grep -q '35729:35729' docker-compose.yml; then
  echo "AC1/AC3 Passed: Ruby version and ports are configured correctly."
else
  echo "AC1/AC3 Failed: Ruby version or ports are misconfigured."
  exit 1
fi

# AC2: Ensure Live Reload works (flags are present in Dockerfile)
if grep -q '"--watch"' Dockerfile && grep -q '"--force_polling"' Dockerfile && grep -q '"--livereload"' Dockerfile; then
  echo "AC2 Passed: Live Reload flags are present in Dockerfile."
else
  echo "AC2 Failed: Live Reload flags are missing in Dockerfile."
  exit 1
fi

# AC4: Document Docker setup
if grep -q 'docker-compose up' README.md; then
  echo "AC4 Passed: Docker setup instructions are present in README.md."
else
  echo "AC4 Failed: Docker setup instructions are missing in README.md."
  exit 1
fi

echo "All ACs passed for Docker Preview."
exit 0
