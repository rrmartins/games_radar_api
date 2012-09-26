require File.expand_path('../../../../spec_helper', __FILE__)

describe GamesRadarApi::Client::Publishers do

  before do
    @client = get_client
  end

  describe 'Publishers list' do
    let(:response) { @client.publishers }
    it 'should have at least one result' do
      response.size.must_be :>, 0
    end

    it 'should return valid publishers' do
      response.first.name.wont_be_nil
    end
  end



end