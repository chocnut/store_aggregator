require 'capybara'
require 'capybara/poltergeist'

class Crawler
  include Capybara::DSL
  Capybara.current_driver = :poltergeist
  attr_reader :results

  STORES = [
    {
      :name => 'lazada',
      :url=> 'http://www.lazada.sg'
    },
    {
      :name => 'value_basket',
      :url => 'http://www.valuebasket.com.sg/en_SG'
    }
  ]

  def initialize(search_term)
    @search_term = search_term
    @results = []
  end

  def scrape
    get_items
    Capybara.use_default_driver
  end

  def get_items
    STORES.each do |store|
      if store[:name] == 'lazada'
        store[:url] += "/catalog/?q=#{@search_term}"
        get_lazada_items(store[:url])
      elsif store[:name] == 'value_basket'
        store[:url] += "/search/search_by_ss?q=#{@search_by_ss}"
        get_vb_items(store[:url])
      end
    end
  end

  private

    def get_lazada_items(url='')
      unless url.blank?
        visit url
      end
      all('.product-card').each do |items|
        name = items.find('.product-card__name').text
        price = items.find('.product-card__price').text
        image_url = items.find('.product-card__img img')['data-original']
        store = 'lazada'

        @results << {
          name: name,
          price: price,
          image_url: image_url,
          store: store
        }
      end

     if has_link?('next page')
        find('.next_link').click
        get_lazada_items
     end
    end

    def get_vb_items(url)
    end
end