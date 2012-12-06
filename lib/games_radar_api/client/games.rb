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
          if response.game.name.nil?
            response.game.name = nil
          elsif response.game.name.include?("us")
            response.game.name = response.game.name.us
          end

          if response.game.release_date.nil?
            response.game[:release_date] = nil
          end

          if response.game.platform.nil?
            response.game[:platform] = nil
          elsif response.game.platform.include?("name")
            response.game[:platform] = response.game.platform.name
          end

          if response.game.genre.nil?
            response.game[:genre] = nil
          elsif response.game.genre.include?("name")
            response.game[:genre] = response.game.genre.name
          end

          if response.game.publishers.nil?
            response.game[:publishers] = nil
          elsif response.game.publishers.include?("us")
            response.game[:publishers] = response.game.publishers.us
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