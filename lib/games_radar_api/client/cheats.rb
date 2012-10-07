module GamesRadarApi
  class Client
    module Cheats
      def cheats(options={:region=>'us',:platform=>'all',:genre=>'all',:game_name=>'',:page_num=>1,:page_size=>10,:sort=>'newest'})
         response = get('/cheats',options)
         self.total_rows = response.cheats.total_rows.to_i
         response.cheats.cheat
      end

      def game_cheats(id,options={:region=>'us',:page_num=>1,:page_size=>10,:content=>'all_cheat'})
        response = get("/game/cheats/#{id}",options)
        self.total_rows = response.cheats.total_rows.to_i
        response.cheats.cheat
      end

    end
  end
end