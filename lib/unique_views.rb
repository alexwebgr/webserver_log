module AWB
  class UniqueViews
    def initialize(views)
      @views = views
    end

    def draw
      return "No Data" unless bucket

      results = []
      bucket.each do |v|
        results << "#{v[0]} #{v[1]} unique views"
      end

      results
    end

    def bucket
      return false if @views.empty?

      holder = {}
      @views.each do |line|
        url, ip = line.split
        holder[url] = [] unless holder.key?(url)
        holder[url] << ip
      end

      holder.transform_values { |v| v.uniq.count }.sort_by{|_, v| -v}
    end
  end
end
