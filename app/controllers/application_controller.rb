require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "corroboration_is_the_key"
  end

  get '/' do
    erb :"/index"
  end

  get '/terms' do
    erb :"/terms"
  end

  helpers do
    def logged_in?
      !!session[:username]
    end

    def current_user
      User.find_by(username: session[:username])

    end
  end
end
