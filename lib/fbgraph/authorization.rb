module FBGraph
  
  class Authorization
    
    def initialize(client)
      @client = client
    end
    
    def authorize_url(params = {})
      @client.oauth_client.web_server.authorize_url(params)
    end
    

    def process_callback(code, options = {})
      @client.consumer = @client.oauth_client.web_server.get_access_token(code, options)
      @client.access_token = @client.consumer.token
    end

  end  
end
