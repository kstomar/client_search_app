# Base command interface
class Command
  def execute
    raise NotImplementedError, "Subclasses must implement the `execute` method"
  end
end