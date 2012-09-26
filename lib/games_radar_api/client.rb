module GamesRadarApi
  class Client < API
    Dir[File.expand_path('../client/*.rb',__FILE__)].each{ |f| require f }

    include GamesRadarApi::Client::Cheats
    include GamesRadarApi::Client::Developers
    include GamesRadarApi::Client::Franchises
    include GamesRadarApi::Client::Games
    include GamesRadarApi::Client::Genres
    include GamesRadarApi::Client::Guides
    include GamesRadarApi::Client::News
    include GamesRadarApi::Client::Publishers
    include GamesRadarApi::Client::Screenshots
    include GamesRadarApi::Client::Videos

  end # Client
end