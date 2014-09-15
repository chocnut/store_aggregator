class SearchesController < ApplicationController

  def create
    Rails.cache.delete(params[:store][:search])
    redirect_to search_path(params[:store][:search])
  end

  def show
    begin
      result_items = StoreSearcher.new("#{params[:id]}").results
      current_page = params[:page] || 1
      per_page = 15

      if params.has_key?(:sort)
        if params[:sort][:order] == 'high'
          result_items = result_items.sort_by { |k| k[:price].to_f }.reverse
        elsif params[:sort][:order] == 'low'
          result_items = result_items.sort_by { |k| k[:price].to_f }
        end
      end

      @items = WillPaginate::Collection.create(current_page.to_i, per_page, result_items.length) do |pager|
        start = (current_page.to_i - 1) * per_page
        pager.replace result_items[start, per_page]
      end
    rescue Capybara::Poltergeist::TimeoutError => e
      puts e.message
      logger.error e.message
      redirect_to root_path, :flash => { :error => "Search Timed Out!" }
    rescue Capybara::Poltergeist::ObsoleteNode => e
      puts e.message
      logger.error e.message
      redirect_to root_path, :flash => { :error => "Something went wrong!" }
    end

  end
end
