require_relative 'config/env'

builder = Opal::Builder.new stubs: %w'opal opal-browser'
builder.append_paths 'assets/js'
# builder.use_gem 'opal-jquery'
OPAL_BLD = builder

class Server < Roda
  plugin :view_options
  plugin :render, engine: 'haml'
  plugin :assets,
    js: %w'
      vendor/opal.js
      vendor/opal-browser.js
      application.rb
    ',
    js_opts: { builder: OPAL_BLD },
    css: 'style.css'
  compile_assets if ENV['COMPILE_ASSETS']

  route do |r|
    r.assets

    r.root do
      render 'index'
    end
  end
end

# class Server < Sinatra::Base
#   get '/' do
#     haml :index
#   end
# end
