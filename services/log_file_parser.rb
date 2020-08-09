class LogFileParser
  def initialize(filename:)
    @filename = filename
    @data     = {}
  end

  def call
    File.open(filename).each do |line|
      page, ip_address = line.split(' ')

      data[page] ||= []
      data[page] << ip_address
    end

    data
  end

  private

  attr_reader :data, :filename
end
