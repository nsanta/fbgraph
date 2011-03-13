require 'rubygems'
require "bundler/setup"
require 'active_support/all'
require 'oauth2'
require 'json'
require 'hashie'
require 'rest_client'
require 'uri'
require "base64"
require "openssl"

require 'fbgraph/result'
require 'fbgraph/client'
require 'fbgraph/base'
require 'fbgraph/authorization'
require 'fbgraph/selection'
require 'fbgraph/search'
require 'fbgraph/realtime'
require 'fbgraph/canvas'

module FBGraph
  @config = nil

  class << self
    def config
      @config ||= load_config(config_path).freeze
    end
    
    def config_path
      if defined?(Rails)
        File.join(Rails.root , 'config' , 'facebook.yml')
      else
        'facebook.yml'
      end
    end

    def load_config(yaml_file)
      return {} unless File.exist?(yaml_file)
      cfg = YAML::load(File.open(yaml_file))
      if defined? Rails
        cfg = cfg[Rails.env]
      end
      cfg
    end
  end
end
