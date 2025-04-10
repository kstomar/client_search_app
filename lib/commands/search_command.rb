require_relative '../search/client_searcher'
require_relative '../validators/field_validator'
require_relative '../search/strategies/field_search_strategy'
require_relative 'command'

class SearchCommand < Command
  def initialize(clients:, field:, query:)
    @clients = clients
    @field = field
    @query = query
    FieldValidator.new(@clients).validate!(@field)
  end

  def execute
    strategy = FieldSearchStrategy.new(@field)
    searcher = ClientSearcher.new(@clients, strategy)
    searcher.search(@query)
  end
end