require 'spec_helper'

RSpec.describe DataSourceFactory do
  describe '.build' do
    context 'when the file is a JSON file' do
      it 'returns an instance of JsonClientLoader' do
        loader = DataSourceFactory.build('data/clients.json')
        expect(loader).to be_an_instance_of(JsonClientLoader)
      end
    end

    context 'when the file type is unsupported' do
      it 'raises an error for unsupported file types' do
        expect {
          DataSourceFactory.build('data/clients.csv')
        }.to raise_error('Unsupported file type')
      end
    end
  end
end
