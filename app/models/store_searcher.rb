class StoreSearcher
  attr_reader :results

  def initialize(search_term)
    if Rails.cache.read(search_term)
      @results = Rails.cache.read(search_term)
    else
      crawler = Crawler.new(search_term)
      crawler.scrape
      @results = crawler.results
      Rails.cache.write search_term, crawler.results
    end
  end

end
