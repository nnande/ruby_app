require_relative '../log_parser'

describe LogParser do
  describe '#call' do
    subject { described_class.new(filename: filename).call }



    context 'when file does not exists' do
      let(:filename) { File.open('./webserverrr.log') }

      it 'raises error' do
        subject
      end
    end

    context 'when file exists' do
      let(:filename) { File.open('./webserver.log') }

      context 'and is valid' do
        it 'lists webpages ordered by views DESC' do
          subject
        end

        it 'lists unique webpages ordered by views DESC' do
          subject
        end
      end
    end
  end
end