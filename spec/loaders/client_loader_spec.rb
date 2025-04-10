require 'spec_helper'

RSpec.describe ClientLoader do
  context 'when a subclass inherits from ClientLoader' do
    it 'must implement the `all` method' do
      class TestClientLoader < ClientLoader
        def all
          [{ 'email' => 'test@example.com', 'name' => 'Test User' }]
        end
      end

      loader = TestClientLoader.new
      expect(loader.all).to eq([{ 'email' => 'test@example.com', 'name' => 'Test User' }])
    end

    it 'raises NotImplementedError if subclass does not implement `all`' do
      class IncompleteClientLoader < ClientLoader
      end

      incomplete_loader = IncompleteClientLoader.new
      expect { incomplete_loader.all }.to raise_error(NotImplementedError)
    end
  end
end
