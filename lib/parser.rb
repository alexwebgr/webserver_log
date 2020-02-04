require_relative 'page_visits'
require_relative 'unique_views'

module AWB
  class Parser
    def initialize
      @visits = []
      @views = []
    end

    def parse(file)
      return print "please provide correct file\n" if file.nil? || !File.exists?(file)

      File.open(file).each do |line|
        @visits << line.split(' ')
        @views << line.strip
      end

      print [
              AWB::PageVisits.new(@visits).draw,
              AWB::UniqueViews.new(@views).draw
            ].join("\n") + "\n"
    end
  end
end
