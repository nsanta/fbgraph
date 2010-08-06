module FacebookGraphController
  def self.included(base)
    base.send(:include, InstanceMethods)
  end
    
  module InstanceMethods
    def client
      @client ||= FBGraph::Client.new(:client_id => FacebookGraphSettings.client_id,
                                      :secret_id => FacebookGraphSettings.secret_id , 
                                      :token => session[:access_token])    
    end
  end
end