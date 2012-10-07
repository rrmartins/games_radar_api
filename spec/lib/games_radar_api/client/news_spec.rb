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

  describe 'Previews List' do

    it 'should fetch some previews by default' do
      @client.previews.size.must_be :>, 0
    end

  end

  describe 'Reviews List' do

    it 'should fetch some reviews by default' do
      @client.reviews.size.must_be :>, 0
    end


  end

  describe 'Game News' do
    it 'should fetch news for a specified game' do
      @client.game_news(8783)
      @client.total_rows.must_be :>, 0
    end
  end

  describe 'Game Reviews' do
    it 'should fetch reviews for a specified game' do
      @client.game_reviews(8783)
      @client.total_rows.must_be :>, 0
    end
  end

  describe 'Game Previews' do
    it 'should fetch previews for a specified game' do
      @client.game_previews(8783)
      @client.total_rows.must_be :>, 0
    end
  end

  describe 'Game Features' do
    it 'should fetch features for a specified game' do
      @client.game_features(8783)
      @client.total_rows.must_be :>, 0
    end
  end


end