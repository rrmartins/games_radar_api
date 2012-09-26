require File.expand_path('../../../../spec_helper', __FILE__)

describe GamesRadarApi::Client::News do

  before do
    @client = get_client
  end

  describe 'News list' do
    it 'should have at least one result' do
      @client.news
      @client.total_rows.must_be :>, 0
    end
  end

  describe 'Features List' do

    it 'should fetch 10 features by default' do
      @client.features.size.must_equal 10
    end

    it 'should allow filtering by game name' do
      response = @client.features(:game_name=>'d')
      response.each do |f|
        f.game.name.downcase[0].must_equal 'd'
      end
    end

  end



end