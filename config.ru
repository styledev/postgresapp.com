require 'bundler'
Bundler.require

require './web'

use Rack::Static, urls: ["/css", "/images", "/js", "favicon.ico"], root: "public"
use Rack::Chartbeat, uid: 43692, domain: "postgresapp.com"

run Web
