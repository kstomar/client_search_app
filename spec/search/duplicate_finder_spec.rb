require 'spec_helper'

RSpec.describe DuplicateFinder do
  let(:file_path) { File.expand_path('../../../data/clients.json', __FILE__) }
  let(:clients) { JSON.parse(File.read(file_path)) }

  describe '#find' do
    context 'when using DuplicateDetectionStrategy on a unique field' do
      it 'returns an empty hash if there are no duplicates' do
        strategy = DuplicateDetectionStrategy.new('id') # assuming IDs are unique
        finder = DuplicateFinder.new(clients, strategy)

        expect(finder.find).to eq({})
      end
    end

    context 'when using DuplicateDetectionStrategy on a duplicated field' do
      it 'returns duplicates grouped by the duplicated value' do
        dup_email = clients.first['email']
        clients_with_dupes = clients + [{ 'email' => dup_email }]

        strategy = DuplicateDetectionStrategy.new('email')
        finder = DuplicateFinder.new(clients_with_dupes, strategy)

        result = finder.find

        expect(result).to have_key(dup_email)
        expect(result[dup_email].size).to be > 1
      end
    end
  end
end
