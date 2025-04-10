class ClientSearcher
  def initialize(clients, strategy)
    @clients = clients
    @strategy = strategy
  end

  def search(query)
    @clients.select { |client| @strategy.match?(client, query) }
  end
end
