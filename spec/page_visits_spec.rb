require './lib/parser'

describe AWB::PageVisits do
  describe '#draw' do
    it('returns "No Data" when bucket is empty') do
      visits = []

      expect(AWB::PageVisits.new(visits).draw).to eq('No Data')
    end

    it('returns the list') do
      visits = [["/help_page/1", "126.318.035.038"], ["/contact", "184.123.665.067"], ["/home", "184.123.665.067"], ["/about/2", "444.701.448.104"], ["/help_page/1", "929.398.951.889"]]

      expect(AWB::PageVisits.new(visits).draw).to eq(["/help_page/1 2 visits", "/contact 1 visits", "/home 1 visits", "/about/2 1 visits"])
    end
  end
end