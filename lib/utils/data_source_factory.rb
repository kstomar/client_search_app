require_relative '../loaders/json_client_loader'

class DataSourceFactory
  def self.build(file_path)
    case File.extname(file_path)
    when ".json"
      JsonClientLoader.new(file_path)
    else
      raise "Unsupported file type"
    end
  end
end