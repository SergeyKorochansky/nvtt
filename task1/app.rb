require 'sinatra'
require 'sinatra/flash'
require 'sinatra/asset_pipeline'
require 'bootstrap-sass'

enable :sessions
set :sessions, httponly: true, secure: production?, expire_after: 60*60, secret: ENV['SESSION_SECRET']

use Rack::Deflater
register Sinatra::AssetPipeline

get '/login' do
  haml :login
end

post '/login' do
  redirect :profile
end

post '/logout' do
  redirect :login
end

get '/profile' do
  haml :profile
end