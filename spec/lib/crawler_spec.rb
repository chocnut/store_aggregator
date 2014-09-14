require 'spec_helper'

describe Crawler do

  let(:crawler) { Crawler.new('iphone5s') }

  before(:each) do
    crawler.scrape
  end

  describe '#results' do
    it "returns an array of combined store scrapped data" do
      expect(crawler.results).to be_an(Array)
    end
  end

end
