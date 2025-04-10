require 'spec_helper'

RSpec.describe JsonFormatter do
  let(:data) { { "name" => "John", "email" => "john@example.com" } }
  let(:formatter) { JsonFormatter.new(data) }

  describe '#render' do
    it 'returns the data in a pretty-printed JSON format' do
      expected_json = JSON.pretty_generate(data)
      expect(formatter.render).to eq(expected_json)
    end

    it 'handles empty data gracefully' do
      empty_data = {}
      empty_formatter = JsonFormatter.new(empty_data)
      expect(empty_formatter.render).to eq("{\n}")
    end

    it 'handles nil data gracefully' do
      nil_data = nil
      nil_formatter = JsonFormatter.new(nil_data)
      expect(nil_formatter.render).to eq("null")
    end
  end
end
