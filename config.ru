require 'bundler'
Bundler.require

require './web'

use Rack::Static, urls: ["/css", "/images", "/js", "favicon.ico"], root: "public"
use Rack::Chartbeat, uid: 43692, domain: "postgresapp.com"
use Rack::Gauges, tracker: '510bec47108d7b3870000019'

run Web
