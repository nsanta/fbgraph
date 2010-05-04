module FBAuth
  
  module Authorization
    def self.authorize(request, redirect_uri , scope)
      oauth_client.web_server.authorize_url(
        :redirect_uri => redirect_uri,
        :scope => scope.join(',')
      )
    end
    
    
    

    def self.process_callback(code, redirect_uri)
      self.access_token = oauth_client.web_server.get_access_token(code, :redirect_uri => redirect_uri).token
    end

  end  
end
