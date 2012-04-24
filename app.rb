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
    markdown :index, :layout_engine => :haml
  end
end