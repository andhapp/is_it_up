require File.join(File.dirname(__FILE__), "spec_helper")

describe "IsItUp" do
  specify "should render 'Yup, it is still up.' if the path begins with '/is_it_up' in the request path" do
    app = Rack::Builder.new do
            use Rack::Lint
            use Rack::IsItUp
            run lambda {|env| [200, {"Content-type" => "text/html"}, ["Passing it up to the main stack"]] }
          end
    response = Rack::MockRequest.new(app).get('/is_it_up')
    response.body == 'Yup, it is still up.'
  end
  
  specify "should pass it up the main stack if it does not have is_it_up in the request path" do
    app = Rack::Builder.new do
            use Rack::Lint
            use Rack::IsItUp
            run lambda {|env| [200, {"Content-type" => "text/html"}, ["Passing it up to the main stack"]] }
          end
    response = Rack::MockRequest.new(app).get('/users/new')
    response.body == 'Passing it up to the main stack'
  end

end