module FBGraph
  
  class Authorization
    
    def initialize(client)
      @client = client
    end
    
    def authorize_url(params = {})
      params = { :redirect_uri => FBGraph.config[:canvas_url] }.merge(params)
      @client.oauth_client.web_server.authorize_url(params)
    end
    

    def process_callback(code, options = {})
      options = { :redirect_uri => FBGraph.config[:canvas_url] }.merge(options)
      @client.consumer = @client.oauth_client.web_server.get_access_token(code, options)
      @client.access_token = @client.consumer.token
    end

  end  
end
