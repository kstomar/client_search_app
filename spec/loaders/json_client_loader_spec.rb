require 'spec_helper'

RSpec.describe JsonClientLoader do
  let(:file_path) { File.expand_path('../../../data/clients.json', __FILE__) }

  describe '#all' do
    it 'reads and parses the JSON file into an array of clients' do
      loader = JsonClientLoader.new(file_path)
      clients = loader.all

      expect(clients).to be_an(Array)
      expect(clients.first).to be_a(Hash)
    end

    it 'contains expected fields (like name or email)' do
      loader = JsonClientLoader.new(file_path)
      clients = loader.all
      expect(clients.first).to include('name').or include('email')
    end

    it 'raises an error if the file path is invalid' do
      invalid_loader = JsonClientLoader.new('non_existent_file.json')
      expect { invalid_loader.all }.to raise_error(Errno::ENOENT)
    end
  end
end
