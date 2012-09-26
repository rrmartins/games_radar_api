
require File.expand_path('../../../../spec_helper', __FILE__)

describe GamesRadarApi::Client::Cheats do

  before do
    @client = get_client
  end

  describe 'Cheats List' do
    it 'should have at least one result' do
      @client.cheats
      @client.total_rows.must_be :>, 0
    end

    it 'should have a cheat url' do
      response = @client.cheats
      response.each do |c|
        c.url.wont_be_nil
      end
    end

  end
end