module GamesRadarApi
  class Client
    module Guides
      def guides(options={:region=>'us',:platform=>'all',:genre=>'all',:game_name=>'',:page_num=>1,:page_size=>10,:sort=>'newest'})
         response = get('/guidesandfaqs',options)
         self.total_rows = response.cheats.total_rows.to_i
         response.cheats.cheat
      end

    end
  end
end