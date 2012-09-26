module GamesRadarApi
  class Client
    module Franchises
      def franchises
        get('/franchises').franchises.franchise
      end
    end
  end
end
