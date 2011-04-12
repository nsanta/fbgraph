module FBGraph
  
  class Client

    attr_accessor :client_id , :secret_id , :facebook_uri , :access_token , :consumer , :auth
      
    def initialize(options = {})
      @client_id, @secret_id = options[:client_id] || FBGraph.config[:client_id], options[:secret_id] || FBGraph.config[:secret_id]
      @ca_file = options[:ca_file] || FBGraph.config[:ca_file] || default_ca_file
      @facebook_uri = options[:facebook_uri] || 'https://graph.facebook.com'
      @consumer = RestClient::Resource.new(@facebook_uri, rest_client_ssl_options)
      @access_token = options.fetch :token, nil
      @auth = OAuth2::AccessToken.new(oauth_client , @access_token)
      return true
    end
    
    def set_token(new_token)
      @access_token = new_token
      @auth = OAuth2::AccessToken.new(oauth_client , @access_token)
      new_token
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
      OAuth2::Client.new(client_id, secret_id, :site => { :url => facebook_uri }, :ssl => oauth_client_ssl_options, :adapter => :typhoeus)
    end

    def oauth_client_ssl_options
      { :ca_file => @ca_file, :verify => OpenSSL::SSL::VERIFY_PEER }
    end

    def rest_client_ssl_options
      { :ssl_ca_file => @ca_file, :verify_ssl => OpenSSL::SSL::VERIFY_PEER }
    end

    def default_ca_file
      File.join(File.dirname(__FILE__), 'cacert.pem')
    end
  end
end
