module FBGraph
  class Search < Base

    def initialize(client)
      @objects = 'search'
      super(client)
    end
    
    def query(q)
      @params = {:q => q}
      return self
    end
    
    def on(type)
      @params.merge!({:type => type})
      return self
    end
    
    
     
  end
end
