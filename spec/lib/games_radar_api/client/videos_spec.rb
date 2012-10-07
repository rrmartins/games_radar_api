require File.expand_path('../../../../spec_helper', __FILE__)

describe GamesRadarApi::Client::Videos do

  before do
    @client = get_client
  end

  describe 'Videos List' do
    it 'should have at least one result' do
      @client.videos
      @client.total_rows.must_be :>, 0
    end

  end

  describe 'Game Videos' do
    it 'should fetch videos for a specified game' do
      @client.game_videos(8783)
      @client.total_rows.must_be :>, 0
    end
  end

end