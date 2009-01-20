module Merb::Generators

  class RearViewsGenerator < NamespacedGenerator
    
    def self.source_root
      File.dirname(__FILE__) / 'templates'
    end
    
    desc <<-DESC
      Generators REST views for a resource, so that complex views and forms can be easily built
    DESC
    
    first_argument  :name, :required => true, :desc => "model name"
    second_argument :attachments, :required => true, :as => :array, :default => [], :desc => "space separated list of fields"

    [:index, :show, :edit, :new, :_form, :_list_view, :_full_view ].each do |view|
      template "#{view}".to_sym, :template_engine => :erb, :orm => :none do |template|
        template.source = "app/views/%file_name%/#{view}.html.erb"
        template.destination = "app/views" / base_path / "#{file_name}/#{view}.html.erb"
      end
    end

  #   template :paperclip do
  #     source(File.dirname(__FILE__) / 'templates' / '%file_name%.rb')
  #     destination("schema/migrations/#{migration_file_name}.rb")
  #   end
  #   
  #   def version
  #     format("%03d", current_migration_nr + 1)
  #   end
  #   
  #   def migration_file_name
  #     names = migration_attachments
  #     "#{version}_add_attachments_#{names.join("_")}_to_#{class_name.underscore}"
  #   end
  #   
  #   def migration_name
  #     names = migration_attachments
  #     "add_attachments_#{names.join("_")}_to_#{class_name.underscore}".classify
  #   end
  # 
  #   protected
  #   
  #   def migration_attachments      
  #     names = attachments.map(&:underscore)
  #     attachments.length == 1 ? names : names[0..-2] + ["and", names[-1]]
  #   end
  #   
  #   def destination_directory
  #     File.join(destination_root, 'schema', 'migrations')
  #   end
  # 
  #   def current_migration_nr
  #     Dir["#{destination_directory}/*"].map{|f| File.basename(f).match(/^(\d+)/)[0].to_i  }.max.to_i
  #   end
  #   
  # end

  add :rear_views, RearViewsGenerator
end