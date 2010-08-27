require 'oauth2'
require 'json'
require 'hashie'
require 'rest_client'
require 'uri'
require "base64"
require "openssl"

module FBGraph
  @config = {}

  class << self
    def load_config(yaml_file)
      return false unless File.exist?(yaml_file)
      cfg = YAML.load(ERB.new(File.read(yaml_file)).result)
      if defined? RAILS_ENV
        cfg = cfg[RAILS_ENV]
      end
      @config = lambda { |key| cfg[key.to_s] }
    end

    def config
      @config
    end
    
  end
end

FBGraph.load_config("#{RAILS_ROOT}/config/fbgraph.yml")

require 'fbgraph/client'
require 'fbgraph/base'
require 'fbgraph/authorization'
require 'fbgraph/selection'
require 'fbgraph/search'
require 'fbgraph/realtime'
require 'fbgraph/canvas'
