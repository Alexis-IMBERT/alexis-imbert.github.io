#!/bin/bash

# Validate that collection slugs and _data keys stay in sync.
# - Fails if a project/publication markdown file has no metadata entry.
# - Fails if a metadata entry has no corresponding markdown file.

set -e

cd "$(dirname "$0")/.."

echo "Validating project/publication data keys against collection slugs..."

ruby <<'RUBY'
require "yaml"

def collection_slugs(glob)
  Dir.glob(glob).map do |path|
    base = File.basename(path, ".md")
    next if base.start_with?("_")
    base
  end.compact.sort
end

def data_keys(path)
  data = YAML.load_file(path)
  return [] unless data.is_a?(Hash)
  data.keys.map(&:to_s).sort
end

def report(collection_name, slugs, keys)
  missing = slugs - keys
  orphan = keys - slugs

  puts "- #{collection_name}: #{slugs.size} documents, #{keys.size} data entries"
  unless missing.empty?
    puts "  Missing data entries for slugs: #{missing.join(", ")}"
  end
  unless orphan.empty?
    puts "  Orphan data entries without markdown file: #{orphan.join(", ")}"
  end

  missing.empty? && orphan.empty?
end

projects_slugs = collection_slugs("_projects/*.md")
projects_keys = data_keys("_data/projects.yml")
publications_slugs = collection_slugs("_publications/*.md")
publications_keys = data_keys("_data/publications.yml")

ok_projects = report("projects", projects_slugs, projects_keys)
ok_publications = report("publications", publications_slugs, publications_keys)

if ok_projects && ok_publications
  puts "Slug/data key validation passed."
  exit 0
end

puts "Slug/data key validation failed."
exit 1
RUBY