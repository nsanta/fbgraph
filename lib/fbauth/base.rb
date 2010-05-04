module FBAuth
  
  class << self
    attr_accessor :access_token , :client_id , :secret_id
    
    def init(access_token , client_id , secret_id)
      self.access_token , self.client_id , self.secret_id = access_token , client_id , secret_id
      @facebook_uri = 'https://graph.facebook.com'
    end
  
  
    def oauth_client
      OAuth2::Client.new(client_id, secret_id, :site => @facebook_uri)
    end
    
    def build_open_graph_uri(id,connection_type = nil, params = {})
      params.merge!(:access_token => access_token)
      request = [@facebook_uri , id , connection_type].compact.join('/')
      request += "?"+params.to_a.map{|p| p.join('=')}.join('&') 
      request
    end
    
  end
end
