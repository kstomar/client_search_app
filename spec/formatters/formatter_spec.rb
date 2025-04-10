require 'spec_helper'

RSpec.describe Formatter do
  it 'raises a NotImplementedError if `render` method is not implemented in subclass' do
    class IncompleteFormatter < Formatter
    end

    incomplete_formatter = IncompleteFormatter.new("data")
    expect { incomplete_formatter.render }.to raise_error(NotImplementedError)
  end

  it 'does not raise an error when subclass implements `render`' do
    class TestFormatter < Formatter
      def render
        "formatted data"
      end
    end

    test_formatter = TestFormatter.new("data")
    expect(test_formatter.render).to eq("formatted data")
  end
end
