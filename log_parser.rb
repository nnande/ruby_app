class LogParser
  def initialize(filename:)
    @filename = filename
    @data = {}
  end

  def call
    parse_data
    process_data
    present_data
  end

  private

  attr_reader :filename

  def parse_data
    File.open(filename).each do |line|
      page, ip_address = line.split(' ')

      @data[page] ||= []
      @data[page] << ip_address
    end
  end

  def process_data
    @data.each do |page, ip_addresses|
      @data[page] = {}
      @data[page][:visits_count] = ip_addresses.count
      @data[page][:unique_visits_count] = ip_addresses.uniq.count
      @data[page][:data] = ip_addresses
    end

    @ordered_by_visits_desc = @data.to_a.sort { |x, y| y.last[:visits_count] <=> x.last[:visits_count] }
    @ordered_by_unique_visits_desc = @data.to_a.sort { |x, y| y.last[:unique_visits_count] <=> x.last[:unique_visits_count] }
  end

  def present_data
    {
        ordered_by_visits_desc: @ordered_by_visits_desc.map { |item| "#{item.first}: #{item.last[:visits_count]}"  },
        ordered_by_unique_visits_desc: @ordered_by_unique_visits_desc.map { |item| "#{item.first}: #{item.last[:unique_visits_count]}" }
    }
  end
end