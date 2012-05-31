class App < Sinatra::Base
  helpers do
    def markdown(template, options = {}, locals = {})
      options.merge!({
        layout_engine: 'haml',
        hard_wrap: true,
        filter_html: true,
        autolink: true,
        no_intraemphasis: true,
        fenced_code: true,
        gh_blockcode: true
      })

      @toc = render(:markdown, template, options.merge(renderer: Redcarpet::Render::HTML_TOC, layout: false), locals)

      render(:markdown, template, options.merge(renderer: Redcarpet::Render::HTML.new(with_toc_data: true)), locals)
    end
  end



  get '/' do
    haml :index
  end

  get '/download' do
    redirect "http://postgres.mesmerizeapp.com/latest"
  end

  get '/documentation' do
    markdown :documentation
  end
end
