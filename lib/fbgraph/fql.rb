module FBGraph
  class FQL < Base
    
    
    def query(q)
      find('fql').param(:q => q).info!
    end
  end
end
