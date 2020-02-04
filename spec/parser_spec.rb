require './lib/parser'

describe AWB::Parser do
  describe '#parse' do
    context 'incorrect file' do
      let(:output) { `bin/parser ./spec/fixtures/non.log` }
      it 'raise error' do
        expect(output).to eq("please provide correct file\n")
      end
    end

    context 'correct file' do
      describe 'Final' do
        let(:output) { `bin/parser ./spec/fixtures/final.log` }
        it 'returns the list' do
          expect(output).to eq(<<~EOS
            /help_page/1 2 visits
            /contact 1 visits
            /home 1 visits
            /about/2 1 visits
            /help_page/1 2 unique views
            /contact 1 unique views
            /home 1 unique views
            /about/2 1 unique views
            EOS
          )
        end
      end

      describe 'empty' do
        let(:output) { `bin/parser ./spec/fixtures/empty.log` }
        it 'returns the list' do
          expect(output).to eq(<<~EOS
            No Data
            No Data
            EOS
          )
        end
      end
    end
  end
end