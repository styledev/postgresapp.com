require 'sinatra'
require 'haml'
require 'json'

STDOUT.sync = true

class App < Sinatra::Base
  helpers do
    def partial(page, variables = {})
      *directories, file = page.to_s.split(/\//)
      haml "#{directories.join("/")}_#{file}".to_sym, { :layout => false }, variables
    end
  end

  get '/' do
    haml :index
  end
end