class LogFilePresenter
  def initialize(data:)
    @visits        = data[:visits]
    @unique_visits = data[:unique_visits]
  end

  def call
    {
      visits:        visits.map { |item| present_log_item(item: item, attribute: :visits_count) },
      unique_visits: unique_visits.map { |item| present_log_item(item: item, attribute: :unique_visits_count) }
    }
  end

  private

  attr_reader :visits, :unique_visits

  def present_log_item(item:, attribute:)
    url  = item.first
    data = item.last

    "#{url}: #{data[attribute]}"
  end
end
