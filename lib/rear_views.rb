# make sure we're running inside Merb
if defined?(Merb::Plugins)

  Merb::BootLoader.before_app_loads do
  end
  
  Merb::BootLoader.after_app_loads do
  end
  
  generators = File.join(File.dirname(__FILE__), 'generators')
  Merb.add_generators( generators / 'rear_views_generator')
end