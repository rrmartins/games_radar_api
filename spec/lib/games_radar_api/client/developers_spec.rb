require File.expand_path('../../../../spec_helper', __FILE__)

describe GamesRadarApi::Client::Developers do

  before do
    @client = get_client
  end

  describe 'Developers list' do
    let(:response) { @client.developers }
    it 'should have at least one result' do
      response.size.must_be :>, 0
    end

    it 'should return valid developers' do
      response.first.name.must_equal ' Eyebrow Interactive'
    end
  end



end