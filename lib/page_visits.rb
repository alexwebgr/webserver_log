module AWB
  class PageVisits
    def initialize(visits)
      @visits = visits
    end

    def draw
      return "No Data" unless bucket

      results = []
      bucket.each do |v|
        results << "#{v[0]} #{v[1]} visits"
      end

      results
    end

    def bucket
      return false if @visits.empty?

      counts = Hash.new(0)
      @visits.each do |v|
        counts[v[0]] += 1
      end

      counts.sort { |a, b| b[1] <=> a[1] }
    end
  end
end
