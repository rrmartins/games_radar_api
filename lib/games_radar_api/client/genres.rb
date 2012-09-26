module GamesRadarApi
  class Client
    module Genres
      def genres
        get('/genres').genres.genre
      end
    end
  end
end
