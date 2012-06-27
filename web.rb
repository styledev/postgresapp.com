class Web < Sinatra::Base
  get '/' do
    cache_control :public, :must_revalidate, max_age: 3600
    
    haml :index, layout: false
  end

  get '/download' do
    redirect "https://postgres.mesmerizeapp.com/latest"
  end
end
