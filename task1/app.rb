require 'sinatra'
require 'sinatra/flash'

enable :sessions
set :sessions, httponly: true, secure: production?, expire_after: 60*60, secret: ENV['SESSION_SECRET']

use Rack::Deflater

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