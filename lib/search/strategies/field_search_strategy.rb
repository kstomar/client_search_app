class FieldSearchStrategy
  def initialize(field)
    @field = field
  end

  def match?(client, query)
    value = client[@field]
    !!(value && value.downcase.include?(query.downcase))
  end
end