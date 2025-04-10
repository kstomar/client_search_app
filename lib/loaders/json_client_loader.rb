require_relative 'client_loader'
require 'json'

class JsonClientLoader < ClientLoader
  def initialize(file_path)
    @file_path = file_path
  end

  def all
    file = File.read(@file_path)
    JSON.parse(file)
  end
end