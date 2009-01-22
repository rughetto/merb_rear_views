require File.dirname(__FILE__) + '/spec_helper'
require 'rubygems'
require 'merb-core'
require 'merb-gen'
require 'templater/spec/helpers'
require 'activerecord'

Merb.disable(:initfile)
Spec::Runner.configure do |config|
  config.include Templater::Spec::Helpers
end

require File.dirname(__FILE__) + '/../lib/generators/rear_views_generator'
require File.dirname(__FILE__) + "/database_setup"
include DatabaseSetup

describe "rear_views" do
  before(:all) do
    @path = "tmp"
  end  
  
  
  describe 'test setup' do
    it "should have all dependencies and rake tasks needed to run" do
      true.should == true
    end
    
    it 'should be able to instantiate a RearViewGenerator' do
      lambda do
        Merb::Generators::RearViewsGenerator.new( @path, {}, 'Test' )
      end.should_not raise_error  
    end  
  end  
  
  describe 'inclusion in merb-gen' do
    
    
  end  
  
  describe 'file generation' do
    before(:all) do
      @generator = Merb::Generators::RearViewsGenerator.new( 'spec/tmp', {}, 'User' )
    end 
    
    before(:each) do
      system "rm -r tmp"
    end  
    
    it "should create views when invoke! is called" do
      @generator.invoke!
      File.exists?("tmp/app/views/user/_form.html.erb")
      File.exists?("tmp/app/views/user/_full_view.html.erb")
      File.exists?("tmp/app/views/user/_list_view.html.erb")
      File.exists?("tmp/app/views/user/delete.html.erb")
      File.exists?("tmp/app/views/user/edit.html.erb")
      File.exists?("tmp/app/views/user/index.html.erb")
      File.exists?("tmp/app/views/user/new.html.erb")
      File.exists?("tmp/app/views/user/show.html.erb")
    end
     
  end  
   
end