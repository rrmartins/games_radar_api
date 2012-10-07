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

    client =   GamesRadarApi.client(:api_key=>'<YOUR_API_KEY>')
    # search for games called Darksiders on the XBOX 360
    response = client.game_search('Darksiders','xbox360')

The following methods are available to you:

    games(options={:platform=>'all',:genre=>'all',:page_num=>1,:page_size=>10,:sort=>'newest'})

    game(id)

    game_search(query,platform,options={:region=>'us'})

    game_cheats(id,options={:region=>'us',:page_num=>1,:page_size=>10,:content=>'all_cheat'})

    game_guides(id,options={:region=>'us',:page_num=>1,:page_size=>10})

    game_news(id,options={:region=>'us',:page_num=>1,:page_size=>10})

    game_features(id,options={:region=>'us',:page_num=>1,:page_size=>10})

    game_previews(id,options={:region=>'us',:page_num=>1,:page_size=>10})

    game_reviews(id,options={:region=>'us',:page_num=>1,:page_size=>10})

    game_screenshots(id,options={:region=>'us',:page_num=>1,:page_size=>10})

    game_videos(id,options={:region=>'us',:page_num=>1,:page_size=>10})

    cheats(options={:region=>'us',:platform=>'all',:genre=>'all',:game_name=>'',:page_num=>1,:page_size=>10,:sort=>'newest'})

    developers()

    franchises()

    genres()

    guides(options={:region=>'us',:platform=>'all',:genre=>'all',:game_name=>'',:page_num=>1,:page_size=>10,:sort=>'newest'})

    news(options={:region=>'us',:platform=>'all',:genre=>'all',:game_name=>'',:page_num=>1,:page_size=>10,:sort=>'newest'})

    features(options={:region=>'us',:platform=>'all',:genre=>'all',:game_name=>'',:page_num=>1,:page_size=>10,:sort=>'newest'})

    previews(options={:region=>'us',:platform=>'all',:genre=>'all',:game_name=>'',:page_num=>1,:page_size=>10,:sort=>'newest'})

    reviews(options={:region=>'us',:platform=>'all',:genre=>'all',:game_name=>'',:page_num=>1,:page_size=>10,:sort=>'newest'})

    platforms()

    publishers()

    screenshots(options={:region=>'us',:platform=>'all',:genre=>'all',:game_name=>'',:unique_game=>false,:page_num=>1,:page_size=>10,:sort=>'newest'})

    videos(options={:region=>'us',:platform=>'all',:genre=>'all',:game_name=>'',:page_num=>1,:page_size=>10,:sort=>'newest'})

Each request returns an array of Hashie Mash objects which you can then manipulate in any way that you wish.

### NOTE

Please note that during testing I found that elements of the Games Radar API don't work as expected.  Here's a few of the issues that I found:

1. news - this method returns total_rows but the not the articles themselves
1. game_features, game_previews, game_reviews and game_news - returns total_rows but not the articles
1. game - this method fetches information about the game, but I'm yet to find a game with a thumbnail image, and the empty_logo image they send returns a 404
1. videos and game_videos - whilst the API call works, visiting the video URL in the URL attribute always goes to a 404 page
1. screenshots and game_screenshots - no data is returned

It's also recommended that you look through the Games Radar API Documentation for a clearer idea of the parameters values which each method accepts http://dl.gamesradar.com/api/GamesRadar_Developer_API_Documentation.pdf

## Credits

This gem is created by Cube Websites
