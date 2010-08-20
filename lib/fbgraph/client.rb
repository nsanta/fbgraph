module FBGraph
  
  class Client
      attr_accessor :client_id , :secret_id , :facebook_uri , :access_token , :consumer , :auth
      
    
      def initialize(options)
        @client_id , @secret_id = options[:client_id] , options[:secret_id]
        @facebook_uri = 'https://graph.facebook.com'
        @access_token = options[:token]
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
