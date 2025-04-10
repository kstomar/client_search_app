require 'json'

class JsonFormatter
  def initialize(data)
    @data = data
  end

  def render
    JSON.pretty_generate(@data)
  end
end