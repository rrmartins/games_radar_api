# GamesRadarApi

This gem is a fully featured API wrapper for the Games Radar API.

## Installation

Add this line to your application's Gemfile:

    gem 'games_radar_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install games_radar_api

## Configuration

You can use a block configuration to specify the API key. e.g.

    GamesRadarApi.configure do |config|
      config.api_key = "YOUR_CLIENT_ID"
    end


## Usage

To start using the GamesRadarAPI just initialize the client and start requesting. e.g.

    require 'games_radar_api'

    client = games_radar_api
    # search for games called Darksiders on the XBOX 360
    response = client.game_search('Darksiders','xbox360')

Each request returns an array of Hashie objects which you can then manipulate in any way that you wish.

For a full list of available request methods have a look through the lib/games_radar_api/client directory
It's also recommended that you look through the Games Radar API Documentation for a clearer idea of the parameters values which each method accepts http://dl.gamesradar.com/api/GamesRadar_Developer_API_Documentation.pdf

## Credits

This gem is created by Cube Websites
