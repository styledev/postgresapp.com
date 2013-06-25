require 'bundler'
Bundler.require

require './web'

use Rack::Static, urls: ["/css", "/images", "/js", "favicon.ico"], root: "public"
use Rack::Gauges, tracker: ENV['GAUGES_TRACKER_ID'] if ENV['GAUGES_TRACKER_ID']

run Web
