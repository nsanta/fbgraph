module FBGraph
  
  class Client
    attr_accessor :client_id , :secret_id , :facebook_uri , :access_token , :consumer 
    
    def initialize(options = {})
      self.client_id, self.secret_id = options[:client_id] || FBGraph.config[:client_id], options[:secret_id] || FBGraph.config[:secret_id]
      @facebook_uri = 'https://graph.facebook.com'
      if self.access_token = options[:token]
        self.consumer = OAuth2::AccessToken.new(oauth_client , self.access_token)
      end
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
    
    def parse_signed_request(request)
      require "base64"
      require "openssl"
      
      encoded_sig, payload = request.split('.', 2)
      
      sig = ""
      Base64.urldecode64(encoded_sig).each_byte { |b|
        sig << "%02x" % b
      }
      data = ActiveSupport::JSON.decode base64_url_decode(payload)
      
      if data['algorithm'].to_s.upcase != 'HMAC-SHA256'
        raise "Bad signature algorithm: %s" % data['algorithm']
      end
      
      expected_sig = OpenSSL::HMAC.hexdigest('sha256', self.secret_id, payload)
      if expected_sig != sig
        raise "Bad signature"
      end
      
      data
    end
  end  
end
