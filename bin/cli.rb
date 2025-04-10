#!/usr/bin/env ruby
require_relative '../lib/commands/search_command'
require_relative '../lib/commands/duplicates_command'
require_relative '../lib/loaders/json_client_loader'
require_relative '../lib/formatters/json_formatter'
require_relative '../lib/utils/data_source_factory'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: cli.rb [options]"

  opts.on("-f", "--file PATH", "Path to JSON file") { |f| options[:file] = f }
  opts.on("-q", "--query QUERY", "Search query string") { |q| options[:query] = q }
  opts.on("--field FIELD", "Field to search (e.g., name, email)") { |f| options[:field] = f }
  opts.on("-d", "--duplicates", "Find duplicate emails") { options[:duplicates] = true }
end.parse!

file_path = options[:file] || 'data/clients.json'
clients = DataSourceFactory.build(file_path).all

if options[:duplicates]
  command = DuplicatesCommand.new(
    clients: clients,
    field: options[:field]
  )
else
  command = SearchCommand.new(
    clients: clients,
    field: options[:field],
    query: options[:query]
  )
end
result = command.execute
puts JsonFormatter.new(result).render
