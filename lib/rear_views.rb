# make sure we're running inside Merb
if defined?(Merb::Plugins)

  Merb::BootLoader.before_app_loads do
  end
  
  Merb::BootLoader.after_app_loads do
  end
  
  Merb.add_generators(File.join(File.dirname(__FILE__), 'generators', 'rear_views_generator'))
end