require 'sinatra'
require 'sinatra/flash'
require 'sinatra/asset_pipeline'
require 'bootstrap-sass'
require_relative 'user'

module NVTT
  class App < Sinatra::Application
    configure do
      enable :sessions
      set :session_secret, ENV['SESSION_SECRET']

      use Rack::Deflater
      register Sinatra::AssetPipeline
    end

    get '/' do
      haml :root
    end

    get '/login' do
      if logged_in?
        redirect :profile, flash[:notice] = 'You are already logged in!'
      else
        @title = 'Login'
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
            flash[:notice] = "Hello!, #{user.name}"
            redirect :profile
          else
            user.unsuccessful_tries += 1
            user.last_incorrect_login_try_at = Time.now.to_i
            user.save
            flash[:error] = 'Incorrect credentials'
            redirect :login
          end
        else
          flash[:error] = "Try again after #{user.can_login_after} seconds"
          redirect :login
        end
      end
    end

    post '/logout' do
      session[:user_name] = nil
      redirect :login
    end

    get '/profile' do
      if logged_in?
        @title = 'Profile'
        @user_name = session[:user_name]
        haml :profile
      else
        redirect :login, flash[:notice] = 'You must be logged in'
      end
    end

    def logged_in?
      !session[:user_name].nil?
    end
  end
end
