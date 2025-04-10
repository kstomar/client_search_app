require 'spec_helper'

RSpec.describe SearchCommand do
  let(:file_path) { File.expand_path('../../../data/clients.json', __FILE__) }
  let(:clients) { JSON.parse(File.read(file_path)) }
  let(:query) { 'john' }
  let(:field) { 'email' }
  let(:search_command) { SearchCommand.new(clients: clients, field: field, query: query) }

  describe '#execute' do
    context 'when the query matches clients' do
      it 'returns an array of matching clients' do
        results = search_command.execute

        expect(results).to be_an(Array)
        expect(results.size).to be > 0
        expect(results.first).to include('email')
      end
    end

    context 'when the query does not match any clients' do
      it 'returns an empty array' do
        search_command = SearchCommand.new(clients: clients, field: field, query: 'nonexistent')
        results = search_command.execute
        expect(results).to eq([])
      end
    end
  end
end
