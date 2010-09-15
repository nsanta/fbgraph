module FBGraph
  
  class Client

    attr_accessor :client_id , :secret_id , :facebook_uri , :access_token , :consumer , :auth
      
    def initialize(options = {})
      @client_id, @secret_id = options[:client_id] || FBGraph.config[:client_id], options[:secret_id] || FBGraph.config[:secret_id]
      @access_token ||= options[:access_token]
      @facebook_uri = 'https://graph.facebook.com'
      @consumer = RestClient::Resource.new(@facebook_uri)
      @auth = OAuth2::AccessToken.new(oauth_client , @access_token)
      return true
    end
    
    def authorization
      FBGraph::Authorization.new(self)
    end
    
    def selection
      FBGraph::Selection.new(self)
    end
    
    def search
      FBGraph::Search.new(self)
    end
    
    def realtime
      FBGraph::Realtime.new(self)
    end
    
    def oauth_client
      OAuth2::Client.new(client_id, secret_id, :site => facebook_uri)
    end
    
  end  
end
