require 'rubygems'
require 'rake/gempackagetask'

require 'merb-core'
require 'merb-core/tasks/merb'
require 'spec/rake/spectask'

GEM_NAME = "rear_views"
GEM_VERSION = "0.0.2"
AUTHOR = "Rue The Ghetto"
EMAIL = "ru_ghetto@rubyghetto.com"
HOMEPAGE = "http://github.com/rughetto/rear_views"
SUMMARY = "Generators REST views for a resource, so that complex views and forms can be easily built. Currently only AR introspection and ERB templates."

spec = Gem::Specification.new do |s|
  s.rubyforge_project = 'merb'
  s.name = GEM_NAME
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README", "LICENSE", 'TODO']
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.add_dependency('merb-core')
  s.require_path = 'lib'
  s.files = %w(LICENSE README Rakefile TODO Generators) + Dir.glob("{lib,spec}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

WIN32 = (RUBY_PLATFORM =~ /win32|mingw|bccwin|cygwin/) rescue nil
SUDO = WIN32 ? '' : ('sudo' unless ENV['SUDOLESS'])
desc "Install #{GEM_NAME}"
if WIN32
  task :install => :gem do
    system %{gem install --no-rdoc --no-ri -l pkg/#{GEM_NAME}-#{GEM_VERSION}.gem}
  end
  namespace :dev do
    desc 'Install for development (for windows)'
    task :winstall => :gem do
      warn "You can now call 'rake install' instead of 'rake dev:winstall'."
      system %{gem install --no-rdoc --no-ri -l pkg/#{GEM_NAME}-#{GEM_VERSION}.gem}
    end
  end
else
  task :install => :package do
    sh %{#{SUDO} gem install --local pkg/#{GEM_NAME}-#{GEM_VERSION}.gem}
  end
end

desc "Uninstall the gem"
task :uninstall do
  Merb::RakeHelper.uninstall(GEM_NAME, :version => GEM_VERSION)
end

desc "Create a gemspec file"
task :gemspec do
  File.open("#{GEM_NAME}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end

Spec::Rake::SpecTask.new do |t|
   t.warning = true
   t.spec_opts = ["--format", "specdoc", "--colour"]
   t.spec_files = Dir['spec/**/*_spec.rb'].sort   
end