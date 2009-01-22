require 'merb_activerecord'
require 'activerecord'

module Merb::Generators
  class RearViewsGenerator < NamespacedGenerator
    
    def self.source_root
      File.dirname(__FILE__) / 'templates'
    end
    
    desc <<-DESC
      Generators modular REST views for a resource, so that complex views and forms can be easily built
    DESC
    
    first_argument  :name, :required => true, :desc => "model name"
    
    # all the view templates
    [:index, :show, :edit, :new, :delete, :_form, :_list_view, :_full_view ].each do |view|
      template "#{view}".to_sym do |template|
        template.source = "%file_name%/#{view}.html.erb"
        template.destination = "app/views" / base_path / "#{file_name.pluralize}/#{view}.html.erb"
      end
    end
    
    # methods available to the views ---------------
    def klass
      if @klass.blank?
        begin 
          Object.full_const_get( class_name ) # only works for testing
        rescue 
          # for regular merb-gen use the database has not yet connected, so ...
          Merb::Config.session_stores = []
          Merb::Orms::ActiveRecord::Connect.run unless Merb.disabled? :initfile
          # also the model classes haven't been loaded ...
          Merb::BootLoader::LoadClasses.run
        end    
        @klass ||= Object.full_const_get( class_name )
      end
      @klass  
    end  
    
    def columns
      if @columns.blank?
        @columns ||= {}
        klass.columns.each do |col|
          @columns[col.name] = col.type unless ['id', 'created_at', 'updated_at'].include? col.name
        end 
      end 
      @columns 
    end
    
    def relationships
      @relationships ||= klass.reflections.keys
    end   
    
    def singular_name
      symbol_name.singularize
    end  
    
    def plural_name
      singular_name.pluralize
    end  
    
    def instance_var
      "@#{singular_name}"
    end  
    
    def resource_sym
      ":#{singular_name}"
    end  
    
    def resources_sym
      ":#{symbol_name}"
    end  
  end

  add :rear_views, RearViewsGenerator
end