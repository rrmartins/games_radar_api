Dir[File.dirname(__FILE__) + '/games_radar_api/*.rb'].each do |file|
  require file
end

module GamesRadarApi
     extend Configuration

     # Alias for GamesRadarApi::Client.new
     #
     # @return [GamesRadarApi::Client]
     def self.client(options={})
       GamesRadarApi::Client.new(options)
     end

     # Delegate to Instagram::Client
     def self.method_missing(method, *args, &block)
       return super unless client.respond_to?(method)
       client.send(method, *args, &block)
     end

     # Delegate to Instagram::Client
     def self.respond_to?(method)
       return client.respond_to?(method) || super
     end

end
