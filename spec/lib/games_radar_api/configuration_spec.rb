require_relative '../../../spec/spec_helper'

describe 'Configuration' do

  after do
    GamesRadarApi.reset
  end

  GamesRadarApi::Configuration::VALID_CONFIG_KEYS.each do |key|
    describe "#{key}" do
      it 'should return the default value' do
        GamesRadarApi.send(key).must_equal GamesRadarApi::Configuration.const_get("DEFAULT_#{key.upcase}")
      end
    end
  end

  GamesRadarApi::Configuration::VALID_CONFIG_KEYS.each do |key|
    it "should set the #{key}" do
      GamesRadarApi.configure do |config|
        config.send("#{key}=",key)
        GamesRadarApi.send(key).must_equal key
      end
    end
  end

end