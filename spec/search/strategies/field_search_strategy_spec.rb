require 'spec_helper'

RSpec.describe FieldSearchStrategy do
  let(:file_path) { File.expand_path('../../../../data/clients.json', __FILE__) }
  let(:clients) { JSON.parse(File.read(file_path)) }

  let(:strategy) { described_class.new('email') }

  describe '#match?' do
    context 'when the field value includes the query (case-insensitive)' do
      it 'returns true' do
        email = clients.first['email']
        query = email[0..2].upcase

        expect(strategy.match?(clients.first, query)).to be true
      end
    end

    context 'when the field value does not include the query' do
      it 'returns false' do
        expect(strategy.match?(clients.first, 'not-in-email')).to be false
      end
    end

    context 'when the field value is nil or missing' do
      it 'returns false gracefully' do
        client = { 'email' => nil }
        expect(strategy.match?(client, 'john')).to be false
      end
    end
  end
end
