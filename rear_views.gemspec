# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rear_views}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Rue The Ghetto"]
  s.date = %q{2009-01-21}
  s.description = %q{Generators REST views for a resource, so that complex views and forms can be easily built. Currently only AR introspection and ERB templates.}
  s.email = %q{ru_ghetto@rubyghetto.com}
  s.extra_rdoc_files = ["README", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README", "Rakefile", "TODO", "Generators", "lib/generators", "lib/generators/rear_views_generator.rb", "lib/generators/templates", "lib/generators/templates/%file_name%", "lib/generators/templates/%file_name%/_form.html.erb", "lib/generators/templates/%file_name%/_full_view.html.erb", "lib/generators/templates/%file_name%/_list_view.html.erb", "lib/generators/templates/%file_name%/delete.html.erb", "lib/generators/templates/%file_name%/edit.html.erb", "lib/generators/templates/%file_name%/index.html.erb", "lib/generators/templates/%file_name%/new.html.erb", "lib/generators/templates/%file_name%/show.html.erb", "lib/rear_views.rb", "spec/console", "spec/database_setup.rb", "spec/rear_views_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "spec/test_templates", "spec/test_templates/test.html.erb", "spec/tmp", "spec/tmp/app", "spec/tmp/app/views", "spec/tmp/app/views/user", "spec/tmp/app/views/user/_form.html.erb", "spec/tmp/app/views/user/_full_view.html.erb", "spec/tmp/app/views/user/_list_view.html.erb", "spec/tmp/app/views/user/delete.html.erb", "spec/tmp/app/views/user/edit.html.erb", "spec/tmp/app/views/user/index.html.erb", "spec/tmp/app/views/user/new.html.erb", "spec/tmp/app/views/user/show.html.erb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/rughetto/rear_views}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{merb}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Generators REST views for a resource, so that complex views and forms can be easily built. Currently only AR introspection and ERB templates.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<merb-core>, [">= 0"])
    else
      s.add_dependency(%q<merb-core>, [">= 0"])
    end
  else
    s.add_dependency(%q<merb-core>, [">= 0"])
  end
end
