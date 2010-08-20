module FBGraph
  
  class Authorization
    
    def initialize(client)
      @client = client
    end
    
    def authorize_url(params = {})
      @client.oauth_client.web_server.authorize_url(params)
    end
    

    def process_callback(code, options = {})
      @client.auth = @client.oauth_client.web_server.get_access_token(code, options)
      @client.access_token = @client.auth.token
    end

  end  
end
