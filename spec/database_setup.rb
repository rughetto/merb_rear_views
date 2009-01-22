module DatabaseSetup
  database_name = 'rear_views.db'
  
  # remove the old database 
  File.delete(database_name)  if File.file?(database_name)

  # grab the files
  $TESTING = true unless defined?($TESTING) && $TESTING == true
  require File.dirname(__FILE__) + '/../lib/generators/rear_views_generator'
  
  # establish a connection to the sqlite database
  ActiveRecord::Base.establish_connection(
    :adapter =>   'sqlite3',
    :database =>  database_name
  )

  # define a schema
  ActiveRecord::Schema.define do
    create_table :users, :force => true do |t|
      t.column :username,       :string
      t.column :hobbies,        :text
      t.column :birthday,       :date
      t.column :admin,          :boolean
    end
    
    create_table :project, :force => true do |t|
      t.column  :user_id, :integer
      t.column  :name,    :string
      t.column  :description, :text
    end  
    
    create_table :tasks, :force => true do |t|
      t.column :project_id, :integer
      t.column :name, :string
      t.column :description, :text
    end  
  end

  # Related classes
  class User < ActiveRecord::Base
    has_many :projects
  end  
  
  class Project < ActiveRecord::Base
    belongs_to :user
    has_many :tasks
  end  
  
  class Taks < ActiveRecord::Base
    belongs_to :project
  end  
end