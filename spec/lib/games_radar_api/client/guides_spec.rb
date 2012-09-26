
require File.expand_path('../../../../spec_helper', __FILE__)

describe GamesRadarApi::Client::Guides do

  before do
    @client = get_client
  end

  describe 'Guides and Faqs List' do
    it 'should have at least one result' do
      @client.guides
      @client.total_rows.must_be :>, 0
    end

    it 'should have a cheat url' do
      response = @client.guides
      response.each do |c|
        c.url.wont_be_nil
      end
    end

  end
end