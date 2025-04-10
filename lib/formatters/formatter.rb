class Formatter
  def initialize(data)
    @data = data
  end

  def render
    raise NotImplementedError, "Subclasses must implement the `render` method"
  end
end