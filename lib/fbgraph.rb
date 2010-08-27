require 'oauth2'
require 'json'
require 'hashie'
require 'rest_client'
require 'uri'
require "base64"
require "openssl"

require 'fbgraph/client'
require 'fbgraph/base'
require 'fbgraph/authorization'
require 'fbgraph/selection'
require 'fbgraph/search'
require 'fbgraph/realtime'
require 'fbgraph/canvas'

module FBGraph
  @config = {}

  class << self
    
    def load_config(yaml_file)
      return false unless File.exist?(yaml_file)
      cfg = YAML::load(File.open(yaml_file))
      if defined? Rails
        cfg = cfg[Rails.env]
      end
      cfg
    end

    def config
      @config ||= load_config(File.join(Rails.root , 'config' , 'facebook.yml')).freeze
    end
    
  end
end
