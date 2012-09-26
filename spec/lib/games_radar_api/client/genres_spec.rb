require File.expand_path('../../../../spec_helper', __FILE__)

describe GamesRadarApi::Client::Genres do

  before do
    @client = get_client
  end

  describe 'genres list' do
    it 'should have at least one result' do
      response = @client.genres
      response.size.must_be :>, 0
    end



  end



end