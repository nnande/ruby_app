require_relative '../log_parser'

describe LogParser do
  describe '#call' do
    subject { described_class.new(filename: filename).call }

    let(:log_file) { File.open(filename) }

    context 'when file exists' do
      let(:filename) { './webserver.log' }

      context 'and is valid' do
        it 'lists webpages ordered by page views DESC' do
          expected_output = [
            '/about/2: 90',
            '/contact: 89',
            '/index: 82',
            '/about: 81',
            '/help_page/1: 80',
            '/home: 78'
          ]

          expect(subject[:ordered_by_visits_desc]).to eq(expected_output)
        end

        it 'lists unique webpages ordered by views DESC' do
          expected_output = [
            "/help_page/1: 23",
            "/contact: 23",
            "/home: 23",
            "/index: 23",
            "/about/2: 22",
            "/about: 21"
          ]

          expect(subject[:ordered_by_unique_visits_desc]).to eq(expected_output)
        end
      end
    end
  end
end