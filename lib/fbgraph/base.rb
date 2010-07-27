module FBGraph
  
  class Base
    
    attr_reader :objects , :connection_type 
    
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
      if @objects.is_a? Array
        @params.merge!({:ids => @objects.join(',')})
        uri = build_open_graph_path(nil,nil, @params)
      elsif @objects.is_a? String
        uri = build_open_graph_path(@objects , @connection_type, @params)
      end
      puts "FBGRAPH [GET]: #{uri}"
      result = @client.consumer.get(uri)
      return parse_json(result, parsed)
    end
  
  
    def publish!(data = {},parsed = true)
      @params.merge!(data)
      uri = build_open_graph_path(@objects , @connection_type)
      puts "FBGRAPH [POST]: #{uri}"
      result = @client.consumer.post(uri ,  @params , multipart_header)
      return parse_json(result, parsed)
    end
  
    def delete!(parsed = true)
      uri = build_open_graph_path(@objects , nil)
      puts "FBGRAPH [DELETE]: #{uri}"
      result = @client.consumer.delete(uri ,  @params)
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
      return parsed  ? Hashie::Mash.new(JSON.parse(result)) : result
    end
    
    def build_open_graph_path(objects,connection_type = nil , params = {})
      request = "/" + [objects , connection_type].compact.join('/')
      request += "?"+params.to_a.map{|p| p.join('=')}.join('&') unless params.empty?
      request
    end

    def multipart_header
      if multipart?
        header = {"Content-Disposition" => "form-data", "name" => "control-name"}
      end  
      header || {}
    end
    
    def multipart?
      %w(photos).include?(@connection_type) || %w(photo post).include?(@objects)
    end

  end  
end
