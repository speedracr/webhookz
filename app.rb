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

post '/capture' do
  @referrer = request.referrer
  @url = request.url
  @ip = request.ip
  @params = params
  haml :capture
end

get '/capture' do
  haml :capture
end

post '/send' do
  @url = params[:url]
  @body = params[:body]

  haml :post
end
