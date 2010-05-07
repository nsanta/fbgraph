module FBGraph
  class Selection < Base
    
    def me
      find('me')
    end
    
   OBJECTS = %w(user album event group link note page photo post status video).freeze
   
   CONNECTION_TYPES = %w(home photos comments feed	noreply	
                         maybe invited attending declined picture 
                         members picture tagged links groups albums	
                         statuses	videos notes posts events friends	
                         activities interests music books movies television	
                         likes inbox outbox updates).freeze
   
   OBJECTS.each do |object|
     class_eval  <<-METHOD
       def #{object}(object)
         find(object)
         self
       end
     METHOD
   end
   
   CONNECTION_TYPES.each do |object|
     class_eval  <<-METHOD
       def #{object}(object)
         connection(object)
         self
       end
     METHOD
   end
   
   def metadata
     @params.merge!({:metadata => '1'})
     self
   end   
  end
end
