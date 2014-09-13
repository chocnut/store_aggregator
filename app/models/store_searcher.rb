class StoreSearcher
  attr_reader :results

  def initialize(search_term)
    @results = 10.times.map { |i| i }
  end

end
