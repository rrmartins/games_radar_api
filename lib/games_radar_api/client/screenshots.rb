module GamesRadarApi
  class Client
    module Screenshots
      def screenshots(options={:region=>'us',:platform=>'all',:genre=>'all',:game_name=>'',:unique_game=>false,:page_num=>1,:page_size=>10,:sort=>'newest'})
        puts "NOTE: Tested the Screenshot API on 26 September 2012 and it wasn't returning any rows"
        puts "This module will therefore appear in this gem, but please don't be suprised if it doesn't work"
         response = get('/screenshots',options)
         self.total_rows = response.screenshots.total_rows.to_i
         response.screenshots.screenshot
      end

      def game_screenshots(id,options={:region=>'us',:page_num=>1,:page_size=>10})
        response = get("/game/screenshots/#{id}",options)
        self.total_rows = response.screenshots.total_rows.to_i
        response.screenshots.screenshot
      end

    end
  end
end