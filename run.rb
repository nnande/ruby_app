require_relative './log_parser'

LogParser.new(filename: ARGV.pop).call