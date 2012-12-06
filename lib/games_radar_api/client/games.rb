module GamesRadarApi
  class Client
    module Games
      def games(options={:platform=>'all',:genre=>'all',:page_num=>1,:page_size=>10,:sort=>'newest'})
        response = get('/games',options)
        self.total_rows = response.games.total_rows.to_i
        unless response.game.nil? or response.game.id.nil?
          if response.game.name.include?("us")
            response.game.name = response.game.name.us
          end
        end
        response.games.game
      end

      def game(id)
        response = get("/game/#{id}")
        self.total_rows = response.total_rows.to_i
        unless response.game.nil? or response.game.id.nil?
          if response.game.name.include?("us")
            response.game.name = response.game.name.us
          end

          if response.game.release_date.nil?
            response.game[:release_date] = nil
          end

          if response.game.platform.include?("name")
            response.game[:platform] = response.game.platform.name
          end


        end

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