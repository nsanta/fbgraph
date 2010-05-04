module FBAuth
  module Selection
    
    def me
      OpenGraph.fetch(build_open_graph_uri('me'))
    end
    
  end
end
