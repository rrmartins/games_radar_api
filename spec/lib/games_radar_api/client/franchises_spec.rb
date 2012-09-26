require File.expand_path('../../../../spec_helper', __FILE__)

describe GamesRadarApi::Client::Franchises do

  before do
    @client = get_client
  end

  describe 'Franchises list' do
    let(:response) { @client.franchises }
    it 'should have at least one result' do
      response.size.must_be :>, 0
    end

    it 'should return valid franchises' do
      response.first.name.us.must_equal '.hack'
    end
  end



end