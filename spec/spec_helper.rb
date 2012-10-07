require_relative '../lib/games_radar_api'

require 'minitest/autorun'
require 'turn'

Turn.config do |c|
  c.format = :pretty
  c.trace = nil
  c.natural = true
  c.verbose = true
end

def get_client
  GamesRadarApi.client(:api_key=>'<YOUR_API_KEY>')
end