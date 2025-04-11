## Requirements
- Ruby 3.3.6
- Libraries: Json, optparse, bundler

## Dependencies, Run and Test

### DEPENDENCIES
- `bundle install`

### TEST
- `bundle exec rspec spec/`

### RUN
- Just run `bundle exec ruby bin/cli.rb [options]`
- To search in existing JSON data:
  `bundle exec ruby bin/cli.rb -q John --field email`
- To search by passing JSON file:
  `bundle exec ruby bin/cli.rb -f data/clients.json -q John --field email`
- To find duplicates in existing JSON data:
  `bundle exec ruby bin/cli.rb -d --field email`
- To find duplicates by passing JSON file:
  `bundle exec ruby bin/cli.rb -f data/clients.json -d --field email`

## Option Flags

- `-q`: The search query (e.g., a john or alex.johnson@hotmail.com).
- `--field`: The field to search in (e.g., `funame`, `email`).
- `-f`: (Optional) Path to your JSON file. Defaults to `data/clients.json`.
- `-d`: Flag to find duplicate entries.
