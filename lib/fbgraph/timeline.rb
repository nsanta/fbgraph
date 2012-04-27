module FBGraph
  class Timeline < Base
    
    BUILT_IN_ACTIONS = {
      :listens => :music,
      :reads => :news,
      :watches => :movie,
    }
    
    
    def action(namespace,action)
      connection([namespace,action].join(':'))
      self
    end
    
    BUILT_IN_ACTIONS.each do |action,obj|
      class_eval  <<-METHOD
        def #{action}
          find('me').connection("#{[obj,action].join('.')}")
          self
        end
      METHOD
    end
    
    
    
  end
end
