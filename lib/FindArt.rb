$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))
 
require 'rubygems'
require 'mechanize'
require 'hpricot'

#meta programming patch
class Object # http://whytheluckystiff.net/articles/seeingMetaclassesClearly.html
  def meta_def name, &blk
    (class << self; self; end).instance_eval { define_method name, &blk }
  end
end
  
module FindArt
  VERSION = '0.0.1'
end   

require "#{File.dirname(__FILE__)}/FindArt/scraper.rb"
Dir["#{File.dirname(__FILE__)}/FindArt/scrapers/*.rb"].each {|file| require file }
