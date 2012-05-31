class App < Sinatra::Base
  set :markdown, layout_engine: :haml
  
  helpers do
    def markdown(template, options = {}, locals = {})
      options.merge!({
        hard_wrap: true,
        filter_html: true,
        autolink: true,
        no_intraemphasis: true,
        fenced_code_blocks: true,
        gh_codeblock: true,
        with_toc_data: true
      })

      @toc = render(:markdown, template, options.merge(renderer: Redcarpet::Render::HTML_TOC, layout: false), locals)

      render(:markdown, template, options.merge(renderer: HTMLwithAlbino.new(with_toc_data: true)), locals)
    end
  end
  
  before do
    cache_control :public, :must_revalidate, :max_age => 3600
  end

  get '/' do
    haml :index, layout: false
  end

  get '/download' do
    redirect "http://postgres.mesmerizeapp.com/latest"
  end

  get '/documentation' do
    markdown :documentation
  end
end

class HTMLwithAlbino < Redcarpet::Render::HTML
  def block_code(code, language)
    Albino.colorize((code || "").strip, language || :text)
  end
end

