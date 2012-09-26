require 'faraday'
require File.expand_path('../version', __FILE__)

module GamesRadarApi
  module Configuration
    VALID_CONNECTION_KEYS   = [:adapter,:endpoint,:user_agent,:method,:proxy].freeze
    VALID_OPTIONS_KEYS      = [:api_key,:format].freeze
    VALID_CONFIG_KEYS       = VALID_CONNECTION_KEYS + VALID_OPTIONS_KEYS

    DEFAULT_ADAPTER         = Faraday.default_adapter.freeze
    DEFAULT_ENDPOINT        = 'http://api.gamesradar.com'.freeze
    DEFAULT_METHOD          = 'get'.freeze
    DEFAULT_USER_AGENT      = "Games Radar API Gem #{GamesRadarApi::VERSION}".freeze

    DEFAULT_API_KEY         = nil
    DEFAULT_FORMAT          = :xml
    DEFAULT_PROXY           = nil

    # Build accessor methods for every config options so we can do this, for example:
    # GamesRadarApi.format = :xml
    attr_accessor *VALID_CONFIG_KEYS

    # Make sure we have the default values set when we get 'extended'
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in  a block
    def configure
      yield self
    end

    # Create a has of options and their values
    def options
      Hash[* VALID_CONFIG_KEYS.map { |key| [key,send(key)] }.flatten ]
    end

    # Reset all configuration options to defaults
    def reset
      self.adapter    = DEFAULT_ADAPTER
      self.endpoint   = DEFAULT_ENDPOINT
      self.method     = DEFAULT_METHOD
      self.user_agent = DEFAULT_USER_AGENT

      self.api_key    = DEFAULT_API_KEY
      self.format     = DEFAULT_FORMAT
      self.proxy      = DEFAULT_PROXY
    end

  end
end