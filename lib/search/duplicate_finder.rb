class DuplicateFinder
  def initialize(clients, strategy = DuplicateDetectionStrategy.new)
    @clients = clients
    @strategy = strategy
  end

  def find
    @strategy.detect(@clients)
  end
end