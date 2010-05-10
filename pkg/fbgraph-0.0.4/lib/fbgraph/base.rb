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
    
    def params(params)
      @params = params
      return self
    end  
      

    def info(parsed = true)
      if @objects.is_a? Array
        @params.merge!({:ids => ids.join(',')})
        uri = "/"
      elsif @objects.is_a? String
        uri = build_open_graph_path(@objects , @connection_type)
      end
      puts "FBGRAPH [GET]: #{uri}"
      result = @client.consumer.get(uri)
      return parsed  ? JSON.parse(result) : result
    end
  
  
    def publish(data = {},parsed = true)
      @params.merge!(data)
      uri = build_open_graph_path(@objects , @connection_type)
      puts "FBGRAPH [POST]: #{uri}"
      result = @client.consumer.post(uri ,  @params)
      return parsed  ? JSON.parse(result) : result
    end
  
    def delete(parsed = true)
      uri = build_open_graph_path(@objects , nil)
      puts "FBGRAPH [DELETE]: #{uri}"
      result = @client.consumer.delete(uri ,  @params)
      return parsed  ? JSON.parse(result) : result
    end

    %w(limit offset until since).each do |paging|
      class_eval <<-PAGING
        def #{paging}(value)
          @params[:#{paging}] = value
        end
        PAGING
      
    end

    
    private
    
    def build_open_graph_path(objects,connection_type = nil , params = {})
      request = "/" + [objects , connection_type].compact.join('/')
      request += "?"+params.to_a.map{|p| p.join('=')}.join('&') unless params.empty?
      request
    end

  end  
end
