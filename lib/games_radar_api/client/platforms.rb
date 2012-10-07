module GamesRadarApi
  class Client
    module Platforms
      def platforms
        get('/platforms').platforms.platform
      end
    end
  end
end
