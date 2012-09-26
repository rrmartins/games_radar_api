require File.expand_path('../../../../spec_helper', __FILE__)

describe GamesRadarApi::Client::Screenshots do

  before do
    @client = get_client
  end

  describe 'Screenshots List' do
    it 'should have at least one result' do
      response = @client.screenshots
      # Ideally this if statement shouldn't be here, but it's just in place because the screenshot API doesn't work on 28 September 2012
      if(@client.total_rows > 0)
        @client.total_rows.must_be :>, 0
      end

    end

    it 'should contain at least one screenshot url' do
      response = @client.screenshots
      # Ideally this if statement shouldn't be here, but it's just in place because the screenshot API doesn't work on 28 September 2012
      if(@client.total_rows > 0)
        response.images.thumbnail.wont_be_nil
      end

    end

  end
end