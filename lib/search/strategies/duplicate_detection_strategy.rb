class DuplicateDetectionStrategy
  def initialize(field = nil)
    @field = field
  end

  def detect(clients)
    clients.group_by { |client| client[@field] }
           .select { |_key, group| group.size > 1 }
  end
end