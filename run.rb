require_relative './log_parser'

filename = ARGV.pop

unless filename
  puts '=> ERROR <='
  puts 'filename needs to be provieded when running this script.'
  puts
  puts 'sample usage: ruby ./run.rb ./spec/files/webserver.log'
  return
end

unless File.exists?(filename)
  puts '=> ERROR <='
  puts 'file with specified filename does not exist.'
  puts
  puts 'sample usage: ruby ./run.rb ./spec/files/webserver.log'
  return
end

begin
  data = LogParser.new(filename: filename).call

  data.each do |key, values|
    puts
    puts "#{key} =>"
    values.each { |val| puts val }
  end
rescue => e
  puts '=> ERROR <='
  puts
  puts "#{e.class}: #{e.message}"
  puts e.backtrace
end 