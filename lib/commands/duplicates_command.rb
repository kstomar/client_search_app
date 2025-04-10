require_relative '../search/duplicate_finder'
require_relative '../validators/field_validator'
require_relative '../search/strategies/duplicate_detection_strategy'
require_relative 'command'

class DuplicatesCommand < Command
  def initialize(clients:, field:)
  	@clients = clients
    @field = field
    FieldValidator.new(@clients).validate!(@field)
  end

  def execute
  	strategy = DuplicateDetectionStrategy.new(@field)
    @finder = DuplicateFinder.new(@clients, strategy)
    @finder.find
  end
end
