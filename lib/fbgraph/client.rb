module FBGraph
  
  class Client
      attr_accessor :client_id , :secret_id , :facebook_uri , :access_token
      attr_writer   :consumer 
      
    
      def initialize(options)
        self.client_id , self.secret_id = options[:client_id] , options[:secret_id]
        self.access_token = options[:token]
        @facebook_uri = 'https://graph.facebook.com'
        
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
      
      def consumer
        @consumer ||= OAuth2::AccessToken.new(oauth_client , access_token) if access_token
      end
      
      def oauth_client
        OAuth2::Client.new(client_id, secret_id, :site => facebook_uri)
      end
      
  end  
end
