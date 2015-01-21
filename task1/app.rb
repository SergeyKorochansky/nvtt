require 'sinatra'
require 'sinatra/flash'
require 'sinatra/asset_pipeline'
require 'bootstrap-sass'
require_relative 'user'

enable :sessions
set :sessions, httponly: true, secure: production?, expire_after: 60*60, secret: ENV['SESSION_SECRET']

use Rack::Deflater
register Sinatra::AssetPipeline

get '/login' do
  if logged_in?
    redirect :profile, flash[:notice] = 'You are already logged in!'
  else
    haml :login
  end
end

post '/login' do
  if logged_in?
    redirect :profile, flash[:notice] = 'You are already logged in!'
  else
    user = User.new(params[:name], params[:password])
    if user && user.can_login?
      if user.correct_password?
        user.unsuccessful_tries = 0
        user.save
        session[:user_name] = user.name
        redirect :profile, flash[:notice] = "Hello!, #{user.name}"
      else
        user.unsuccessful_tries += 1
        user.last_incorrect_login_try_at = Time.now.to_i
        user.save
        redirect :login, flash[:error] = 'Incorrect credentials'
      end
    else
      redirect :login, flash[:error] = "Try again after #{user.can_login_after} seconds"
    end
  end
end

post '/logout' do
  session[:user_name] = nil
  redirect :login
end

get '/profile' do
  if logged_in?
    haml :profile
  else
    redirect :login, flash[:notice] = 'You must be logged in'
  end
end

def logged_in?
  !session[:user_name].nil?
end