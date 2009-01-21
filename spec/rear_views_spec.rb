require File.dirname(__FILE__) + '/spec_helper'
require 'rubygems'
require 'merb-core'
require 'merb-gen'
$TESTING = true
require File.dirname(__FILE__) + '/../lib/generators/rear_views_generator'

describe "rear_views" do
  before(:all) do
    @path = File.dirname(__FILE__) + "/../"
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
   
end