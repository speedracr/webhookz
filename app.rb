require 'sinatra'
require 'dotenv'
require 'haml'
require 'sass'
require 'compass'
Dotenv.load

configure do
  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'views/stylesheets'
  end

  set :haml, format: :html5
  set :sass, Compass.sass_engine_options
  set :scss, Compass.sass_engine_options
end

get '/' do
  haml :start
end
