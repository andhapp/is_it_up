require "bundler"
Bundler.setup
Bundler.require :default

module Rack
  class IsItUp
  
    def initialize(app)
      @app = app
    end
  
    def call(env)
      request = Rack::Request.new(env)
      if request.path =~ /^\/is_it_up/
        status, header, response = 200, {"Content-type" => "text/html"}, ["Yup, it is still up."]
      else
        status, header, response = @app.call(env)
      end
      [status, header, response]
    end
  end
end