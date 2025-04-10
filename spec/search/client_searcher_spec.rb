require 'spec_helper'

RSpec.describe ClientSearcher do
  let(:file_path) { File.expand_path('../../../data/clients.json', __FILE__) }
  let(:clients) { JSON.parse(File.read(file_path)) }
  let(:strategy) { FieldSearchStrategy.new('email') }
  let(:searcher) { ClientSearcher.new(clients, strategy) }

  describe '#search' do
    context 'when a client matches the query' do
      it 'returns matching clients' do
        email_fragment = clients.first['email'][0..3]
        results = searcher.search(email_fragment)

        expect(results).to be_an(Array)
        expect(results).to include(clients.first)
      end
    end

    context 'when no client matches the query' do
      it 'returns an empty array' do
        results = searcher.search('definitely-not-in-any-email')
        expect(results).to eq([])
      end
    end
  end
end
