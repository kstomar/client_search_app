require 'spec_helper'

RSpec.describe Command do
  context 'when a subclass inherits from Command' do
    it 'must implement the `execute` method' do
      class TestCommand < Command
        def execute
          true
        end
      end

      command = TestCommand.new
      expect(command.execute).to eq(true)
    end

    it 'raises NotImplementedError if subclass does not implement `execute`' do
      class IncompleteCommand < Command
      end

      incomplete_command = IncompleteCommand.new
      expect { incomplete_command.execute }.to raise_error(NotImplementedError)
    end
  end
end
