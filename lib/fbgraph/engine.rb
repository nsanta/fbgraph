require "fbgraph"
require "rails"

module FBGraph
  class Engine < Rails::Engine
    rake_tasks do
      load "fbgraph/railties/tasks.rake"
    end
    
    initializer 'fbgraph.helpers' do
      ActionView::Base.send :include, FacebookGraphHelper
    end
    
    initializer 'fbgraph.controllers' do
      ActiveSupport.on_load(:action_controller) do
         include FacebookGraphController
      end
    end
  end
end