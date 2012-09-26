require_relative '../lib/games_radar_api'

require 'minitest/autorun'
require 'webmock/minitest'
#require 'vcr'
#require 'turn'
#
#Turn.config do |c|
#  c.format = :pretty
#  c.trace = nil
#  c.natural = true
#  c.verbose = true
#end
WebMock.allow_net_connect!
#VCR.configure do |c|
#  c.cassette_library_dir = 'spec/fixtures/games_radar_api_cassettes'
#  c.hook_into :webmock
#end

def get_client
  GamesRadarApi.client(:api_key=>'<YOUR_API_KEY>')
end