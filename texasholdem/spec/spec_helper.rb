# $:.unshift File.expand_path(File.dirname(__FILE__) + "/../lib/")
Dir["./lib/*.rb"].each {|file| require file }
require 'rspec'