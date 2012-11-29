module GamesRadarApi
  class Client
    module Games
      def games(options={:platform=>'all',:genre=>'all',:page_num=>1,:page_size=>10,:sort=>'newest'})
         response = get('/games',options)
         self.total_rows = response.games.total_rows.to_i
         response.games.game
      end

      def game(id)
        response = get("/game/#{id}")
        self.total_rows = response.total_rows.to_i
        return response.game unless response.game.nil? or response.game.id.nil?
        return nil
      end

      def game_search(query,platform,options={:region=>'us'})
        response = get("/search/gameName/#{platform}/#{query}",options)
        self.total_rows = response.games.total_rows.to_i
        response.games.game
      end

    end
  end
end