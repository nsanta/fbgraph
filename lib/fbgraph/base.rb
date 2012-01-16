module FBGraph
  
  class Base

    attr_reader :objects , :connection_type , :logger, :fields, :last_result
    
    def initialize(client)
      @client = client
      @fields = []
      @params = {}
    end

    def find(objects)
      @objects = objects
      return self
    end
   
    def connection(connection_type)
      @connection_type = connection_type
      return self
    end
    
    def params=(ps)
      @params = ps
      return self
    end  

    def params
      @params
    end
    
    def param(pm)
      @params.merge!(pm)
      return self
    end

    def with_fields(*new_fields)
      @fields.concat(new_fields) if !(new_fields.blank? rescue true)
      @fields = sanitized_fields
      self
    end
    alias :fields :with_fields

    def info!(parsed = true, &block)
      self.instance_eval(&block) if block_given?
      @params.merge!(:fields => sanitized_fields.join(',')) unless sanitized_fields.blank?
      @params.merge!(:access_token => @client.access_token) unless @client.access_token.nil?
      if @objects.is_a? Array
        @params.merge!({:ids => @objects.join(',')})
        path = build_open_graph_path(nil,nil, @params)
      elsif @objects.is_a? String
        path = build_open_graph_path(@objects , @connection_type, @params)
      else
        raise "No Facebook objects were recognized as selected; unable to build fb graph path."
      end
      show_log('GET' , path, @params) if @debug
      result = @client.consumer[path].get
      @last_result = ::FBGraph::Result.new(result, @params)
    end
  
  
    def publish!(data = {},parsed = true, &block)
      @params.merge!(data)
      self.instance_eval(&block) if block_given?
      @params.merge!(:fields => sanitized_fields.join(',')) unless sanitized_fields.blank?
      params = @params.merge(:access_token => @client.access_token) if (@client.access_token)      
      path = build_open_graph_path(@objects , @connection_type)
      show_log('POST' , path, params) if @debug
      result = @client.consumer[path].post(params)
      @last_result = ::FBGraph::Result.new(result, @params)
    end
  
    def delete!(parsed = true, &block)
      self.instance_eval(&block) if block_given?
      path = build_open_graph_path(@objects , nil)
      params = @params.merge(:access_token => @client.access_token) if (@client.access_token)
      params.merge!(:method => :delete)
      show_log('DELETE' , path, params) if @debug
      result = @client.consumer[path].post(params)
      @last_result = ::FBGraph::Result.new(result, @params)
    end

    %w(limit offset until since).each do |paging|
      class_eval <<-PAGING
        def #{paging}(value)
          @params[:#{paging}] = value
          self
        end
        PAGING
    end

    def debug=(att)
      @debug= att
    end

    private
    
    def sanitized_fields
      @fields.flatten.map(&:to_s).compact
    end

    def build_open_graph_path(objects, connection_type = nil , params = {})
      request = [objects , connection_type].compact.join('/')
      request += "?"+params.to_a.map{|p| p.join('=')}.join('&') unless params.empty?
      URI.encode(request)
    end

    def show_log(ver, path, params)
       client.logger.info "FBGRAPH [#{verb}]: #{path}"
       client.logger.info "PARAMS: #{params.to_a.map{|p| p.join('=')}.join('&')}"      
    end

  end  
end
