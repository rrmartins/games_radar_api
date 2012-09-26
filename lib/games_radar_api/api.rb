require File.expand_path('../connection', __FILE__)
require File.expand_path('../request', __FILE__)
require File.expand_path('../configuration', __FILE__)

module GamesRadarApi
  # @private
  class API
    # @private
    attr_accessor *Configuration::VALID_CONFIG_KEYS + [:total_rows]

    # Creates a new API
    def initialize(options={})
      options = GamesRadarApi.options.merge(options)
      Configuration::VALID_CONFIG_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include Connection
    include Request
  end
end