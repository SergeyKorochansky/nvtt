require 'sinatra'

get '/login' do
  haml :login
end