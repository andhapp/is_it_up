require "bundler"
Bundler.setup
Bundler.require :test

require File.join(File.dirname(__FILE__), "..", "lib", "is_it_up")