require 'spec_helper'

RSpec.describe FieldValidator do
  let(:clients) do
    file_path = File.expand_path('../../../data/clients.json', __FILE__)
    JSON.parse(File.read(file_path))
  end

  subject { described_class.new(clients) }

  describe '#validate!' do
    context 'when the field is valid' do
      it 'does not raise an error' do
        expect { subject.validate!('email') }.not_to raise_error
      end
    end

    context 'when the field is invalid' do
      it 'raises an ArgumentError with available fields' do
        expect {
          subject.validate!('nonexistent_field')
        }.to raise_error(ArgumentError, /Invalid field `nonexistent_field`/)
      end
    end

    context 'when the clients array is empty' do
      let(:clients) { [] }

      it 'does not raise an error' do
        expect { subject.validate!('anything') }.not_to raise_error
      end
    end
  end
end
