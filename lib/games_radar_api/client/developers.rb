module GamesRadarApi
  class Client
    module Developers
      def developers
        get('/developers').developers.company
      end
    end
  end
end
