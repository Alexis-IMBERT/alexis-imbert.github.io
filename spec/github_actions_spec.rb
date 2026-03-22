# frozen_string_literal: true

require 'yaml'

describe 'Story 1.3: Setup GitHub Actions Deployment' do
  let(:repo_root) { File.expand_path('..', __dir__) }
  let(:workflow_dir) { File.join(repo_root, '.github', 'workflows') }
  let(:deploy_file) { File.join(workflow_dir, 'deploy.yml') }
  let(:config_file) { File.join(repo_root, '_config.yml') }

  describe 'AC1: GitHub Actions workflow is automatically invoked' do
    it 'deploy.yml file exists' do
      expect(File.exist?(deploy_file)).to be_truthy, '.github/workflows/deploy.yml does not exist'
    end

    describe 'deploy.yml contents' do
      let(:workflow) { YAML.load_file(deploy_file) }

      it 'is triggered on push to main branch' do
        on_key = workflow.key?(true) ? true : 'on'
        expect(workflow[on_key]).not_to be_nil
        expect(workflow[on_key]['push']).not_to be_nil
        expect(workflow[on_key]['push']['branches']).to include('main')
      end

      it 'allows manual dispatch' do
        # In YAML, workflow_dispatch can be nil or an empty hash depending on how it's written
        on_key = workflow.key?(true) ? true : 'on'
        expect(workflow[on_key]).to have_key('workflow_dispatch')
      end
    end
  end

  describe 'AC2: Jekyll build process completes without errors' do
    let(:workflow) { YAML.load_file(deploy_file) }
    
    it 'has a build job' do
      expect(workflow['jobs']).not_to be_nil
      expect(workflow['jobs']['build']).not_to be_nil
    end

    it 'runs on ubuntu-latest' do
      expect(workflow['jobs']['build']['runs-on']).to eq('ubuntu-latest')
    end

    it 'sets up Ruby environment' do
      steps = workflow['jobs']['build']['steps']
      ruby_setup = steps.find { |s| s['uses'] && s['uses'].start_with?('ruby/setup-ruby') }
      expect(ruby_setup).not_to be_nil
      expect(ruby_setup['with']['ruby-version']).to eq('3.2')
    end

    it 'builds with proper Jekyll environment' do
      steps = workflow['jobs']['build']['steps']
      build_step = steps.find { |s| s['run'] && s['run'].include?('jekyll build') }
      expect(build_step).not_to be_nil
      expect(build_step['env']['JEKYLL_ENV']).to eq('production')
    end

    it 'configures GitHub Pages before build' do
      steps = workflow['jobs']['build']['steps']
      setup_pages_step = steps.find { |s| s['uses'] && s['uses'].start_with?('actions/configure-pages') }
      expect(setup_pages_step).not_to be_nil
    end

    it 'uploads pages artifact with official action' do
      steps = workflow['jobs']['build']['steps']
      upload_step = steps.find { |s| s['uses'] && s['uses'].start_with?('actions/upload-pages-artifact') }
      expect(upload_step).not_to be_nil
      expect(upload_step.dig('with', 'path')).to eq('_site/')
    end
  end

  describe 'AC3: Site is deployed to GitHub Pages' do
    let(:workflow) { YAML.load_file(deploy_file) }

    it 'has a deploy job' do
      expect(workflow['jobs']['deploy']).not_to be_nil
    end

    it 'deploy job depends on build job' do
      expect(workflow['jobs']['deploy']['needs']).to eq('build')
    end

    it 'uses actions/deploy-pages' do
      steps = workflow['jobs']['deploy']['steps']
      deploy_step = steps.find { |s| s['uses'] && s['uses'].start_with?('actions/deploy-pages') }
      expect(deploy_step).not_to be_nil
    end

    it 'verifies deployed URL reachability after deployment' do
      steps = workflow['jobs']['deploy']['steps']
      verify_step = steps.find { |s| s['name'] == 'Verify deployed URL is reachable' }
      expect(verify_step).not_to be_nil
      expect(verify_step['run']).to include('steps.deployment.outputs.page_url')
      expect(verify_step['run']).to include('curl')
    end
  end

  describe 'Architecture Compliance' do
    let(:config) { YAML.load_file(config_file) }

    it 'excludes deployment files correctly in _config.yml' do
      expect(config['exclude']).to include('.github')
      expect(config['exclude']).to include('Dockerfile')
      expect(config['exclude']).to include('docker-compose.yml')
    end
  end
end