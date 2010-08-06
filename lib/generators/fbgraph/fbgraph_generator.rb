require 'rails/generators'
require 'rails/generators/migration'     

class FbgraphGenerator < Rails::Generators::Base
  ### GENERATOR STUB
  include Rails::Generators::Migration
  source_root File.join(File.dirname(__FILE__), 'templates')  

  #generates unique migration timestamps by sleeping for a second
  def self.next_migration_number(dirname)
    sleep 1
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end

  def create_migration_file
    #migration_template 'create_some_table.rb', 'db/migrate/create_some_table.rb'
  end
end