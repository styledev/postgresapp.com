require 'bundler'
Bundler.require

require './web'
require './documentation'

use Rack::Static, urls: ["/css", "/images", "/js"], root: "public"
use Rack::GoogleAnalytics, tracker: ENV["GOOGLE_ANALYTICS_TRACKING_ID"] if ENV["GOOGLE_ANALYTICS_TRACKING_ID"]

app = Rack::Builder.new do
  map '/documentation' do
    run Documentation
  end
  
  map '/' do
    run Web
  end
end

run app
