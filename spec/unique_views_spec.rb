require './lib/parser'

describe AWB::UniqueViews do
  describe '#draw' do
    it('returns "No Data" when bucket is empty') do
      views = []

      expect(AWB::UniqueViews.new(views).draw).to eq('No Data')
    end

    it('returns the list') do
      views = ["/help_page/1 126.318.035.038", "/contact 184.123.665.067", "/home 184.123.665.067", "/about/2 444.701.448.104", "/help_page/1 929.398.951.889", "/index 444.701.448.104"]

      expect(AWB::UniqueViews.new(views).draw).to eq(["/help_page/1 2 unique views", "/contact 1 unique views", "/home 1 unique views", "/about/2 1 unique views", "/index 1 unique views"])
    end

    it('returns the list still unique') do
      views = ["/help_page/1 126.318.035.038", "/help_page/1 126.318.035.038", "/contact 184.123.665.067", "/home 184.123.665.067", "/about/2 444.701.448.104", "/help_page/1 929.398.951.889", "/index 444.701.448.104"]

      expect(AWB::UniqueViews.new(views).draw).to eq(["/help_page/1 2 unique views", "/contact 1 unique views", "/home 1 unique views", "/about/2 1 unique views", "/index 1 unique views"])
    end
  end
end