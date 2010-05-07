module FBGraph
  
  class Base
    
    attr_reader :objects , :connection_type
    
    def initialize(client)
      @client = client
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
        uri = build_open_graph_uri(@objects , @connection_type)
      end
      result = @client.consumer.get(uri ,  @params)
      return parsed  ? JSON.parse(result) : result
    end
  
  
    def publish(data = {},parsed = true)
      @params.merge!(data)
      uri = build_open_graph_uri(@objects , @connection_type)
      result = @client.consumer.post(uri ,  @params)
      return parsed  ? JSON.parse(result) : result
    end
  
    def delete(parsed = true)
      uri = build_open_graph_uri(@objects , nil)
      result = @client.consumer.delete(uri ,  @params)
      return parsed  ? JSON.parse(result) : result
    end
  
    private
    
    def build_open_graph_uri(objects,connection_type = nil)
      "/" + [objects, connection_type].compact.join('/')
    end

  end  
end
