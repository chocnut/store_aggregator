class SearchesController < ApplicationController

  def create
    redirect_to search_path(params[:store][:search])
  end

  def show
    result_items = StoreSearcher.new("#{params[:id]}").results
    current_page = params[:page] || 1
    per_page = 15
    @items = WillPaginate::Collection.create(current_page.to_i, per_page, result_items.length) do |pager|
      start = (current_page.to_i - 1) * per_page
      pager.replace result_items[start, per_page]
    end
  end
end
