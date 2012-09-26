module GamesRadarApi
  class Client
    module News
      def news(options={:region=>'us',:platform=>'all',:genre=>'all',:game_name=>'',:page_num=>1,:page_size=>10,:sort=>'newest'})
        puts "NOTE: Tested the News API on 26 September 2012 and it wasn't returning any articles, just a number of rows"
        puts "This module will therefore appear in this gem, but please don't be suprised if it doesn't work"
         response = get('/news',options)
         self.total_rows = response.articles.total_rows.to_i
         response.articles.article
      end

      def features(options={:region=>'us',:platform=>'all',:genre=>'all',:game_name=>'',:page_num=>1,:page_size=>10,:sort=>'newest'})
        response = get('/features',options)
        self.total_rows = response.articles.total_rows.to_i
        response.articles.article
      end

    end
  end
end