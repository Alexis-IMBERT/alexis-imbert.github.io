#!/usr/bin/env ruby
# frozen_string_literal: true

require 'yaml'

describe 'Docker Development Environment Configuration' do
  describe 'Dockerfile' do
    let(:dockerfile_content) { File.read('Dockerfile') }

    it 'exists' do
      expect(File.exist?('Dockerfile')).to be true
    end

    it 'uses ruby:3.2 as base image' do
      expect(dockerfile_content).to match(/^FROM ruby:3\.2/)
    end

    it 'exposes necessary ports' do
      expect(dockerfile_content).to match(/^EXPOSE 4000/)
      expect(dockerfile_content).to match(/^EXPOSE 35729/)
    end

    it 'runs jekyll serve with livereload, force polling, and watch' do
      expect(dockerfile_content).to match(/CMD \["bundle", "exec", "jekyll", "serve".*"--host".*"0\.0\.0\.0".*"--port".*"4000".*"--livereload".*"--watch".*"--force_polling"\]/m)
    end
  end

  describe 'docker-compose.yml' do
    let(:compose_content) { YAML.load_file('docker-compose.yml') }

    it 'exists' do
      expect(File.exist?('docker-compose.yml')).to be true
    end

    it 'configures jekyll service correctly' do
      jekyll_service = compose_content['services']['jekyll']
      expect(jekyll_service).not_to be_nil
      expect(jekyll_service['ports']).to include('4000:4000', '35729:35729')
      expect(jekyll_service['volumes']).to include('.:/site')
      expect(jekyll_service['environment']['JEKYLL_ENV']).to eq('development')
      expect(jekyll_service['environment']['JEKYLL_FORCE_POLLING']).to eq('true')
    end
  end

  describe '.dockerignore' do
    let(:dockerignore_content) { File.read('.dockerignore') }

    it 'exists' do
      expect(File.exist?('.dockerignore')).to be true
    end

    it 'ignores sensitive and unnecessary files' do
      expect(dockerignore_content).to match(/^\.git$/)
      expect(dockerignore_content).to match(/^_site$/)
      expect(dockerignore_content).to match(/^\.bundler-cache$/)
    end
  end

  describe '.gitignore' do
    let(:gitignore_content) { File.read('.gitignore') }

    it 'does not ignore .dockerignore' do
      expect(gitignore_content.lines.map(&:strip)).not_to include('.dockerignore')
    end
  end
end
