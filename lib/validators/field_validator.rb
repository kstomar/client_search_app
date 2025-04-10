class FieldValidator
  def initialize(clients)
    @clients = clients
  end

  def validate!(field)
    return if @clients.empty?

    sample_keys = @clients.first.keys.map(&:to_s)
    unless sample_keys.include?(field.to_s)
      raise ArgumentError, "Invalid field `#{field}`. Available fields: #{sample_keys.join(', ')}"
    end
  end
end