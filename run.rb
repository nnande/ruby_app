require_relative './services/log_file_handler'

filename = ARGV.pop

# filename not passed as argument
unless filename
  puts '=> ERROR <='
  puts 'filename needs to be provieded when running this script.'
  puts
  puts 'sample usage: ruby ./run.rb ./webserver.log'
  return
end

# file does not exist
unless File.exists?(filename)
  puts '=> ERROR <='
  puts 'file with specified filename does not exist.'
  puts
  puts 'sample usage: ruby ./run.rb ./webserver.log'
  return
end

begin
  data = LogFileHandler.new(filename: filename).call

  # print data to stdout
  data.each do |key, values|
    puts
    puts "#{key} =>"
    values.each { |val| puts val }
  end

# error handling
rescue => e
  puts '=> ERROR <='
  puts
  puts "#{e.class}: #{e.message}"
  puts e.backtrace
end
