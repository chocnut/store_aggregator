class StoreSearcher
  attr_reader :results

  def initialize(search_term)
    crawler = Crawler.new(search_term)
    crawler.scrape
    @results = crawler.results
  end

end
