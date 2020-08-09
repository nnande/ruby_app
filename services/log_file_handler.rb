require_relative './log_file_parser'
require_relative './log_file_presenter'
require_relative './log_file_processor'

class LogFileHandler
  def initialize(filename:, parser_klass: LogFileParser, processor_klass: LogFileProcessor, presenter_klass: LogFilePresenter)
    @filename        = filename

    @parser_klass    = parser_klass
    @processor_klass = processor_klass
    @presenter_klass = presenter_klass
  end

  def call
    present(process(parse))
  end

  private

  attr_reader :filename, :parser_klass, :processor_klass, :presenter_klass

  def parse
    parser_klass.new(filename: filename).call
  end

  def process(data)
    processor_klass.new(data: data).call
  end

  def present(data)
    presenter_klass.new(data: data).call
  end
end
