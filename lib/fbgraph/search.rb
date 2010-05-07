module FBGraph
  class Search < Base
    
    def query(q)
      @objects = 'search'
      @params = {:q => q}
      return self
    end
    
    def on(type)
      @params.merge!({:type => type})
      return self
    end
    
    
     
  end
end
