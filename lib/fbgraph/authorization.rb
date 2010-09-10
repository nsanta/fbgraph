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
      @client.auth = @client.oauth_client.web_server.get_access_token(code, options)
      @client.access_token = @client.auth.token
    end
    
    def upgrade_session!(key)
      token = upgrade_session_keys(key).first
      @client.access_token = token
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
