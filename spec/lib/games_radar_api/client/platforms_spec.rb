require File.expand_path('../../../../spec_helper', __FILE__)

describe GamesRadarApi::Client::Platforms do

  before do
    @client = get_client
  end

  describe 'Platforms list' do
    let(:response) { @client.platforms }
    it 'should have at least one result' do
      response.size.must_be :>, 0
    end

    it 'should return valid platform' do
      response.first.name.must_equal '3DS'
    end
  end



end