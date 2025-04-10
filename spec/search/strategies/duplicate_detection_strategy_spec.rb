require 'spec_helper'

RSpec.describe DuplicateDetectionStrategy do
  let(:file_path) { File.expand_path('../../../../data/clients.json', __FILE__) }
  let(:clients) { JSON.parse(File.read(file_path)) }

  describe '#detect' do
    context 'when there are no duplicates' do
      it 'returns an empty hash if all values are unique for the field' do
        strategy = described_class.new('id')
        duplicates = strategy.detect(clients)
        expect(duplicates).to be_empty
      end
    end

    context 'when there are duplicates for a field' do
      it 'returns a hash of duplicated values and their records' do
        dup_email = clients.first['email']
        clients_with_dupes = clients + [{ 'email' => dup_email }]

        strategy = described_class.new('email')
        duplicates = strategy.detect(clients_with_dupes)

        expect(duplicates).to be_a(Hash)
        expect(duplicates[dup_email].size).to be > 1
      end
    end
  end
end
