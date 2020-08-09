class LogFileProcessor
  def initialize(data:)
    @data = data
  end

  def call
    data.each do |page, ip_addresses|
      data[page]                       = {}
      data[page][:visits_count]        = ip_addresses.count
      data[page][:unique_visits_count] = ip_addresses.uniq.count
      data[page][:data]                = ip_addresses
    end

    data_array = data.to_a

    {
      visits:        sort(array: data_array, key: :visits_count),
      unique_visits: sort(array: data_array, key: :unique_visits_count)
    }
  end

  private

  def sort(array:, key:)
    array.sort { |x, y| y.last[key] <=> x.last[key] }
  end

  attr_reader :data
end
