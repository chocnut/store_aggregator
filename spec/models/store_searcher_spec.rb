require 'spec_helper'

describe StoreSearcher, '#results' do

  it "returns results from a store search" do
    searcher = StoreSearcher.new('iPhone5s')
    expect(searcher.results.length).to be > 1
  end
end
