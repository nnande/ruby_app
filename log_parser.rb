class LogParser
  def initialize(filename:)
    @filename = filename
  end

  def call
    raise NotImplementedError
  end

  private

  attr_reader :filename
end