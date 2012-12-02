require 'bundler'
Bundler.require

require './web'
require './documentation'

use Rack::Static, urls: ["/css", "/images", "/js", "favicon.ico"], root: "public"
use Rack::Chartbeat, uid: 43692, domain: "postgresapp.com"

app = Rack::Builder.new do
  map '/documentation' do
    run Documentation
  end
  
  map '/' do
    run Web
  end
end

run app
