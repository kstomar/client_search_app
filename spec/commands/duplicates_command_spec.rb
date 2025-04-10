require 'spec_helper'

RSpec.describe DuplicatesCommand do
  let(:file_path) { File.expand_path('../../../data/clients.json', __FILE__) }
  let(:clients) { JSON.parse(File.read(file_path)) }
  let(:field) { 'email' }

  describe '#execute' do
    context 'when no duplicates exist' do
      it 'returns an empty hash' do
        allow_any_instance_of(DuplicateFinder).to receive(:find).and_return({})

        duplicates_command = DuplicatesCommand.new(clients: clients, field: field)
        result = duplicates_command.execute

        expect(result).to eq({})
      end
    end

    context 'when duplicates exist for the field' do
      it 'returns a hash of duplicate values and their corresponding records' do
        dup_email = clients.first['email']
        clients_with_dupes = clients + [{ 'email' => dup_email }]

        allow_any_instance_of(DuplicateFinder).to receive(:find).and_return({
          dup_email => clients_with_dupes.select { |client| client['email'] == dup_email }
        })

        duplicates_command_with_dupes = DuplicatesCommand.new(clients: clients_with_dupes, field: field)
        result = duplicates_command_with_dupes.execute

        expect(result).to be_a(Hash)
        expect(result).to have_key(dup_email)
        expect(result[dup_email].size).to be > 1
      end
    end
  end
end
