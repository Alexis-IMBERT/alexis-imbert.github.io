describe 'Story 2.1: About/CV Page' do
  let(:about_page_path) { File.join('_site', 'about', 'index.html') }

  it 'compiles the about page' do
    expect(File.exist?(about_page_path)).to be true
  end

  describe 'content rendering' do
    let(:content) { File.read(about_page_path) }

    it 'includes the Academic Background section' do
      expect(content).to include('Academic Background')
      expect(content).to include('PhD in Computer Science')
    end

    it 'includes the Professional Experience section' do
      expect(content).to include('Professional Experience')
      expect(content).to include('PhD Researcher')
    end

    it 'uses semantic HTML tags like h1 and h2' do
      # More flexible match that is less fragile than regexes checking spaces, by ignoring whitespace internally
      compact_content = content.gsub(/\s+/, ' ')
      
      expect(compact_content).to match(/<h1.*?>About \/ CV<\/h1>/i)
      expect(compact_content).to match(/<h2.*?>Academic Background<\/h2>/i)
      expect(compact_content).to match(/<h2.*?>Professional Experience<\/h2>/i)
      
      # Also check that articles are used for semantic structures
      expect(content).to include('<article')
    end

    it 'is reachable from top navigation with About / CV link' do
      expect(content).to include('href="/about/"')
      expect(content).to include('About / CV')
    end
  end
end
