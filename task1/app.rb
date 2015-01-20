require 'sinatra'

set sessions: true

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