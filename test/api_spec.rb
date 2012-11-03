require '../src/api/api'
require 'rack/test'

set :environment, :test

describe 'sentimentalizer api' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "will error without a valid input" do
    get '/'
    last_response.should_not be_ok
  end

  it "will return a vlid response with a valid input" do
    get '/', :sentence => 'I hate not tests'
    last_response.should be_ok
    last_response.headers["Content-Type"].should match (/application\/json/i)
  end
end
