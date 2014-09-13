class SearchesController < ApplicationController

  def create
    redirect_to search_path(params[:store][:search])
  end

  def show
    @items = StoreSearcher.new("#{params[:id]}").results
  end
end
