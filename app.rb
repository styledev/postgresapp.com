require 'sinatra'
require 'haml'
require 'json'
require 'redcarpet'

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

  get '/documentation' do
    markdown :documentation, :layout_engine => :haml
  end
end