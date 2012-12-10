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
        game = if response.game.nil? or response.game.id.nil?
                  nil
                else
                  response.game
                end

        if !game.nil?
          if game.name.nil?
            game.name = nil
          elsif game.name.include?("us")
            game.name = game.name.us
          end

          if game.release_date.nil?
            game[:release_date] = nil
          end

          if game.platform.nil?
            game[:platform] = nil
          elsif game.platform.include?("name")
            game[:platform] = game.platform.name
          end

          if game.genre.nil?
            game[:genre] = nil
          elsif game.genre.include?("name")
            game[:genre] = game.genre.name
          end

          if game.publishers.nil?
            game[:publishers] = nil
          elsif game.publishers.include?("us")
            game[:publishers] = game.publishers.us
          end

          if game.description.nil? or game.description.empty?
            game[:description] = nil
          else
            game[:description] = game.description
          end

          if game.censorship.nil?
            game[:esrb] = nil
          else
            game[:esrb] = game.censorship.esrb.rating
          end

          if game.expected_release_date.nil?
            game.expected_release_date = nil
          elsif game.expected_release_date.include?("us")
            game.expected_release_date = game.expected_release_date.us
          end

          if game.developers.nil?
            game.developers = nil
          elsif game.developers.include?("company")
            game.developers = game.developers.company.name
          end

          if game.publishers.nil?
            game.publishers = nil
          elsif game.publishers.include?("company")
            game.publishers = game.publishers.company.name
          end

        end

        return game
      end

      def game_search(query,platform,options={:region=>'us'})
        response = get("/search/gameName/#{platform}/#{query}",options)
        self.total_rows = response.games.total_rows.to_i
        response.games.game
      end

    end
  end
end