require_relative '../../../spec/spec_helper'

describe GamesRadarApi::Client do

  before do
    @keys = GamesRadarApi::Configuration::VALID_CONFIG_KEYS
  end

  describe 'with module configuration' do
    before do
      GamesRadarApi.configure do |config|
        @keys.each do |key|
          config.send("#{key}=",key)
        end
      end
    end

    after do
      GamesRadarApi.reset
    end

    it 'should inherit module configuration' do
      api = GamesRadarApi.client
      @keys.each do |key|
        api.send(key).must_equal key
      end
    end

    describe 'with class configuration' do
      before do
        @config = {
            :api_key    => 'ak',
            :format     => 'of',
            :endpoint   => 'ep',
            :user_agent => 'ua',
            :method     => 'hm',
            :proxy      => 'pr',
            :adapter    => 'ad'
        }
      end

      it 'should override module configuration' do
        api = GamesRadarApi.client
        @config.each do |key,value|
          api.send("#{key}=",value)
        end

        @keys.each do |key|
          api.send("#{key}").must_equal @config[key]
        end

      end

    end

  end


end