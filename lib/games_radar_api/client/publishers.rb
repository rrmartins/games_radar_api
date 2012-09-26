module GamesRadarApi
  class Client
    module Publishers
      def publishers
        get('/publishers').publishers.company
      end
    end
  end
end
