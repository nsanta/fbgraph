# NOTE: This is untested and just the start of cleaning up this file!  I'm sure it's full of bugs now  :)  Don't use this branch.

require 'uri'

module FBGraph
  class Base

    attr_reader :objects , :connection_type , :logger, :fields, :last_result
    
    def initialize(client)
      @client = client || (FBGraph::Config.global_client rescue nil)# TODO: Implement this!
      @fields = []
      @params = {}
      self
    end

    # A logger object for debug output.
    def logger
      (FBGraph.Config.logger rescue nil) || RAILS_DEFAULT_LOGGER
    end

    # Clear and reser the objects for this selection.
    def find(objects)
      @objects = objects
      self
    end
    
    # Add objects to this selection.
    def with_objects(*new_objects)
      @objects.concat(new_objects) if !(new_objects.blank? rescue true)
      @objects = clean_objects
      self
    end
    alias :add_objects :with_objects
    
    # Specify a connection to retrieve.
    def connection(connection_type)
      @connection_type = connection_type
      self
    end
    
    # Set the request params from scratch.
    def params=(ps)
      @params = ps
      self
    end  

    # Get the current params.
    def params
      @params
    end
    
    # Merge into the request params.
    def param(pm)
      @params.merge!(pm)
      self
    end

    # Add fields to be requested.
    def with_fields(*new_fields)
      @fields.concat(new_fields) if !(new_fields.blank? rescue true)
      @fields = clean_fields
      self
    end
    alias :fields :with_fields
    
    # Make a get request.
    def info!(parsed = true, &block)
      yield if block_given?
      params.merge!(:fields => sanitized_fields.join(',')) unless sanitized_fields.blank?
      params.merge!(:access_token => client.access_token) unless client.access_token.nil?
      path = build_open_graph_path(clean_objects, connection_type, params)

      logger(:debug, params.pretty_inspect, "GET: #{objects.pretty_inspect}")
      logger(:debug, "WITH TOKEN: #{client.access_token}", "GET: #{objects.pretty_inspect}")
      logger(:debug, path.to_s, "SELECT: #{self.class.to_s}") do
        result = client.consumer[path].get
        @last_result = parsed ? ::FBGraph::Result.new(result, params) : result
      end
    end
  
    # Publish selection.
    def publish!(data = {}, parsed = true, &block)
      yield if block_given?
      params.merge!(data)
      params.merge!(:fields => sanitized_fields.join(',')) unless sanitized_fields.blank?
      params = params.merge(:access_token => client.access_token) if (client.access_token)
      path = build_open_graph_path(clean_objects, connection_type)

      last_result = ::FBGraph::Result.new(result, params)
      logger(:debug, params.pretty_inspect, "REQUEST: #{objects.pretty_inspect}")
      logger(:debug, path.to_s, "PUBLISH: #{self.class.to_s}") do
        result = client.consumer[path].post(params)
        @last_result = parsed ? ::FBGraph::Result.new(result, params) : result
      end
    end
  
    # Delete selection.
    def delete!(parsed = true, &block)
      yield if block_given?
      path = build_open_graph_path(clean_objects , nil)
      params.merge!(:access_token => client.access_token) if (client.access_token)
      params.merge!(:method => :delete)
   
      logger(:debug, params.pretty_inspect, "REQUEST: #{objects.pretty_inspect}")
      logger(:debug, path.to_s, "DELETE: #{self.class.to_s}") do
        result = client.consumer[path].post(params)
        @last_result = parsed ? ::FBGraph::Result.new(result, params) : result
      end
    end

    %w(limit offset until since).each do |paging|
      class_eval <<-PAGING
        def #{paging}(value)
          @params[:#{paging}] = value
          self
        end
      PAGING
    end

    protected
    
    def clean_array(array = nil, &block)
      block = lambda { |e| e.to_s } unless block_given?
      ((array rescue nil) || []).flatten.map(&block).compact
    end
    
    def clean_fields
      @fields = clean_array(@fields)
    end

    def clean_objects
      @objects = clean_array(@objects) { |o| o.respond_to?(:fb_identifier) ? o.facebook_identifier.to_s : o.to_s }
    end
    
    private

    def build_open_graph_path(objects, connection_type = nil , params = {})
      if objects.many?  # Build an "ids" request param
        params.merge!(:ids => objects.join(','))
        objects = nil
        connection_type = nil
      else # No "ids" param.
        objects = objects.first
      ens
      
      request = [objects , connection_type].compact.join('/')
      request += "?"+params.to_a.map{|p| p.join('=')}.join('&') unless params.empty?
      URI.encode(request)
    end
    
  end  # Base
end # FBGraph
