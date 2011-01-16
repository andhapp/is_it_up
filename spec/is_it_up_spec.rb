require 'spec_helper'

describe "IsItUp" do

  before(:each) do
    @app = Rack::Builder.new do
            use Rack::IsItUp
            run lambda {|env| [200, {"Content-type" => "text/html"}, ["Passing it up to the main stack"]] }
          end
  end

  specify "should render 'Yup, it is still up.' if the path begins with '/is_it_up' in the request path" do
    response = Rack::MockRequest.new(@app).get('/is_it_up')
    response.body == 'Yup, it is still up.'
  end

  specify "should pass it up the main stack if it does not have is_it_up in the request path" do
    response = Rack::MockRequest.new(@app).get('/users/new')
    response.body == 'Passing it up to the main stack'
  end

end
