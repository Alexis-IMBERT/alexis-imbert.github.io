#!/usr/bin/env ruby
# frozen_string_literal: true

require 'yaml'
require 'fileutils'

# Test suite for Story 1.1: Initialize Jekyll Site with al-folio Theme
# Tests verify that the Jekyll site structure and configuration are correct

describe 'Story 1.1: Jekyll Initialization with al-folio Theme' do
  REPO_ROOT = File.expand_path('..', __dir__)
  CONFIG_FILE = File.join(REPO_ROOT, '_config.yml')
  GEMFILE = File.join(REPO_ROOT, 'Gemfile')
  COLLECTIONS = ['_publications', '_projects', '_posts'].freeze
  DIRECTORIES = ['_layouts', '_includes', '_data', 'assets/images', 'assets/css'].freeze

  describe 'AC1: Site structure follows al-folio conventions' do
    it 'creates required collection directories' do
      COLLECTIONS.each do |collection|
        dir_path = File.join(REPO_ROOT, collection)
        expect(File.directory?(dir_path)).to be_truthy, "Missing directory: #{collection}"
      end
    end

    it 'creates required structural directories' do
      DIRECTORIES.each do |directory|
        dir_path = File.join(REPO_ROOT, directory)
        expect(File.directory?(dir_path)).to be_truthy, "Missing directory: #{directory}"
      end
    end

    it '_config.yml exists and is valid YAML' do
      expect(File.exist?(CONFIG_FILE)).to be_truthy, '_config.yml does not exist'
      expect { YAML.load_file(CONFIG_FILE) }.not_to raise_error
    end
  end

  describe 'AC2: Basic site settings configured in _config.yml' do
    let(:config) { YAML.load_file(CONFIG_FILE) }

    it 'has site title configured' do
      expect(config['title']).not_to be_nil, 'title not configured'
      expect(config['title']).to be_a(String)
      expect(config['title']).not_to be_empty
    end

    it 'has site description configured' do
      expect(config['description']).not_to be_nil, 'description not configured'
      expect(config['description']).to be_a(String)
      expect(config['description']).not_to be_empty
    end

    it 'has site URL configured' do
      expect(config['url']).not_to be_nil, 'url not configured'
      expect(config['url']).to be_a(String)
      expect(config['url']).to match(%r{https?://})
    end

    it 'has author name configured' do
      expect(config['author']).not_to be_nil, 'author section not configured'
      expect(config['author']['name']).not_to be_nil, 'author name not configured'
      expect(config['author']['name']).to be_a(String)
    end

    it 'has language set' do
      expect(config['lang']).not_to be_nil, 'language not configured'
      expect(config['lang']).to eq('en')
    end

    it 'has baseurl configured (should be empty for user.github.io)' do
      expect(config['baseurl']).to eq(''), 'baseurl should be empty for user.github.io'
    end
  end

  describe 'AC3: Collections are properly configured' do
    let(:config) { YAML.load_file(CONFIG_FILE) }

    it 'has collections section' do
      expect(config['collections']).not_to be_nil, 'collections not configured'
      expect(config['collections']).to be_a(Hash)
    end

    it 'has publications collection with output enabled' do
      expect(config['collections']['publications']).not_to be_nil
      expect(config['collections']['publications']['output']).to be_truthy
    end

    it 'has projects collection with output enabled' do
      expect(config['collections']['projects']).not_to be_nil
      expect(config['collections']['projects']['output']).to be_truthy
    end

    it 'publications collection has proper permalink' do
      expect(config['collections']['publications']['permalink']).to match(%r{/publications/})
    end

    it 'projects collection has proper permalink' do
      expect(config['collections']['projects']['permalink']).to match(%r{/projects/})
    end
  end

  describe 'AC3: Gemfile with al-folio and dependencies' do
    it 'Gemfile exists' do
      expect(File.exist?(GEMFILE)).to be_truthy, 'Gemfile does not exist'
    end

    it 'Gemfile contains jekyll gem' do
      gemfile_content = File.read(GEMFILE)
      expect(gemfile_content).to include('jekyll'), 'jekyll gem not in Gemfile'
    end

    it 'Gemfile contains al-folio theme' do
      gemfile_content = File.read(GEMFILE)
      expect(gemfile_content).to include('al-folio'), 'al-folio theme not in Gemfile'
    end

    it 'Gemfile contains jekyll-seo-tag gem' do
      gemfile_content = File.read(GEMFILE)
      expect(gemfile_content).to include('jekyll-seo-tag'), 'jekyll-seo-tag gem not in Gemfile'
    end

    it 'Gemfile contains webrick for Ruby 3.x compatibility' do
      gemfile_content = File.read(GEMFILE)
      expect(gemfile_content).to include('webrick'), 'webrick gem not in Gemfile'
    end
  end

  describe 'AC4: Homepage exists' do
    it 'index.md exists' do
      index_path = File.join(REPO_ROOT, 'index.md')
      expect(File.exist?(index_path)).to be_truthy, 'index.md does not exist'
    end

    it 'index.md has frontmatter' do
      index_path = File.join(REPO_ROOT, 'index.md')
      content = File.read(index_path)
      expect(content).to start_with('---'), 'index.md missing frontmatter'
    end
  end

  describe 'AC4: Build configuration' do
    let(:config) { YAML.load_file(CONFIG_FILE) }

    it 'has markdown processor configured' do
      expect(config['markdown']).not_to be_nil, 'markdown processor not configured'
    end

    it 'has theme or remote_theme configured' do
      has_theme = config['theme'] || config['remote_theme']
      expect(has_theme).not_to be_nil, 'neither theme nor remote_theme configured'
    end
  end

  describe 'README documentation' do
    it 'README.md exists' do
      readme_path = File.join(REPO_ROOT, 'README.md')
      expect(File.exist?(readme_path)).to be_truthy, 'README.md does not exist'
    end

    it 'README contains setup instructions' do
      readme_path = File.join(REPO_ROOT, 'README.md')
      content = File.read(readme_path)
      expect(content.downcase).to include('bundle install'), 'README missing bundle install instruction'
    end
  end
end
