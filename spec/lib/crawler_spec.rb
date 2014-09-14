require 'spec_helper'

describe Crawler do

  let(:crawler) { Crawler.new('iphone5s') }

  describe '#results' do
    it "returns an array of combined store scrapped data" do
      VCR.use_cassette('records') do
        crawler.scrape
        expect(crawler.results).to be_an(Array)
      end
    end
  end

end
