require File.expand_path('../../../../spec_helper', __FILE__)

describe GamesRadarApi::Client::Games do

  before do
    @client = get_client
  end

  describe 'Game List' do
    it 'should fetch 10 games by default' do
      response = @client.games
      response.size.must_equal 10
    end

    it 'should filter by platform' do
      response = @client.games(:platform=>'ps3')
      response.each do |g|
        g.platform.name.must_equal 'PS3'
      end
    end
  end

  describe 'Game Detail' do
    it 'should fetch the correct game' do
      response = @client.game('16725')
      response.name.must_equal 'God of War Saga'
    end

    it 'should return nil for an invalid game' do
      response = @client.game('34$')
      response.must_be_nil
    end

    describe "with response.release_date equal nil" do
      it "should return nil of field release_date" do
        response = @client.game('894')
        response.release_date.must_be_nil
      end
    end

    it "should return name of platform" do
      response = @client.game('894')
      response.platform.must_equal('PC')
    end
  end

  describe 'Game Search' do
    it 'should fetch relevant games' do
      response = @client.game_search('Darksiders','xbox360')
      response.each do |g|
         g.name.downcase.must_include 'darksiders'
      end
    end

    it 'should return nil if no games are found' do
      response = @client.game_search('Darksdiers','xbox360')
      response.must_be_nil
    end


  end

end