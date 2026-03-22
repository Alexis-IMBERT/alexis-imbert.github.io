require 'rspec'
require 'nokogiri'

RSpec.describe 'Publication Detail Page' do
  let(:site_dir) { File.expand_path('../../_site', __FILE__) }
  let(:pub_file) { File.join(site_dir, 'publications/test-publication/index.html') }

  before(:all) do
    system('bundle exec jekyll build > /dev/null 2>&1')
  end

  it 'generates a detail page for the publication' do
    expect(File.exist?(pub_file)).to be true
  end

  it 'contains semantic HTML tags' do
    html = File.read(pub_file)
    doc = Nokogiri::HTML(html)
    
    expect(doc.at('article.publication')).not_to be_nil
    expect(doc.at('header')).not_to be_nil
    expect(doc.at('section.abstract')).not_to be_nil
  end

  it 'renders title, authors, venue, date, and abstract' do
    html = File.read(pub_file)
    doc = Nokogiri::HTML(html)
    
    expect(doc.at('h1').text).to include('A Test Publication')
    expect(doc.at('.authors').text).to include('John Doe', 'Jane Smith')
    expect(doc.at('.venue').text).to include('Test Conference')
    expect(doc.at('.date').text).to include('March 2026')
    expect(doc.at('.abstract').text).to include('This is a test abstract.')
  end
end
