module FBGraph
  
  class Base
    
    attr_reader :objects , :connection_type , :logger

    
    def initialize(client)
      @client = client
      @params = {}
    end


    
    def find(objects)
      @objects = objects
      return self
    end
   
  
    def connection(connection_type)
      @connection_type = connection_type
      return self
    end
    
    def params=(ps)
      @params = ps
      return self
    end  

    def params
      @params
    end
    
    def param(pm)
      @params.merge!(pm)
      return self
    end  

    def info!(parsed = true)
      @params.merge!(:access_token => @client.access_token) unless @client.access_token.nil?
      if @objects.is_a? Array
        @params.merge!({:ids => @objects.join(',')})
        path = build_open_graph_path(nil,nil, params)
      elsif @objects.is_a? String
        path = build_open_graph_path(@objects , @connection_type, @params)
      end
      puts "FBGRAPH [GET]: #{path}"
      puts "ACCESS TOKEN: #{@client.access_token}"
      result = @client.consumer[path].get
      return parse_json(result, parsed)
    end
  
  
    def publish!(data = {},parsed = true)
      @params.merge!(data)
      params = @params.merge(:access_token => @client.access_token) if (@client.access_token)      
      path = build_open_graph_path(@objects , @connection_type)
      puts "FBGRAPH [POST]: #{path}"
      puts "PARAMS: #{params.to_a.map{|p| p.join('=')}.join('&')}"
      result = @client.consumer[path].post(params)
      return parse_json(result, parsed)
    end
  
    def delete!(parsed = true)
      path = build_open_graph_path(@objects , nil)
      params = @params.merge(:access_token => @client.access_token) if (@client.access_token)
      params.merge!(:method => :delete)
      puts "FBGRAPH [DELETE]: #{path}"
      puts "PARAMS: #{params.to_a.map{|p| p.join('=')}.join('&')}"      
      result = @client.consumer[path].post(params)
      return parse_json(result, parsed)
    end

    %w(limit offset until since).each do |paging|
      class_eval <<-PAGING
        def #{paging}(value)
          @params[:#{paging}] = value
          self
        end
        PAGING
    end

    
    private
    
    def parse_json(result, parsed)
      return parsed  ? Hashie::Mash.new(JSON.parse(result.body)) : result.body
    end        
    
    def build_open_graph_path(objects, connection_type = nil , params = {})
      request = [objects , connection_type].compact.join('/')
      request += "?"+params.to_a.map{|p| p.join('=')}.join('&') unless params.empty?
      URI.encode(request)
    end

  end  
end
