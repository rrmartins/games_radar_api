module GamesRadarApi
  class Client
    module Videos
      def videos(options={:region=>'us',:platform=>'all',:genre=>'all',:game_name=>'',:page_num=>1,:page_size=>10,:sort=>'newest'})
         response = get('/videos',options)
         self.total_rows = response.videos.total_rows.to_i
         response.videos.video
      end

    end
  end
end