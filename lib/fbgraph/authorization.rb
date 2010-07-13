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

    def upgrade_session_keys(*keys)
      tokens = @client.oauth_client.request(:get, '/oauth/exchange_sessions', {
        :client_id     => @client.client_id,
        :client_secret => @client.secret_id,
        :type          => 'client_cred',
        :sessions      => keys.flatten.join(',')
      })
      
      JSON.parse(tokens).map { |hash| hash['access_token'] if hash}
    end
  end  
end
