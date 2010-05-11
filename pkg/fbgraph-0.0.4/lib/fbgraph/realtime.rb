module FBGraph
  class Realtime < Base

    def initialize(client)
      @objects = 'subscriptions'
      super(client)
    end

    
    OBJECTS = %w(user permissions errors).freeze

    OBJECTS.each do |object|
      class_eval  <<-METHOD
        def #{object}
          @params[:object] = "#{object}"
          self
        end
      METHOD
    end

    def fields(fs = "email,picture")
      @params[:fields] = fs
      self
    end

    def callback_url(url)
      @params[:callback_url] = url
      self
    end

    def veryfy_token(token)
      @params[:veryfy_token] = token
      self
    end 


    alias_method :subscribe! , :publish! 
    
    private
    
    def build_open_graph_path(objects,connection_type = nil , params = {})
      request = "/" + [objects , connection_type].compact.join('/')
      request += "?"+params.to_a.map{|p| p.join('=')}.join('&') unless params.empty?
      request
    end
    
  end
end
