require 'rack-flash'

class UserController < ApplicationController

  use Rack::Flash

  get "/user/signup" do
    if logged_in?
      @user = User.find_by(username: session[:user_id])
      redirect "/user/#{@user.id}"
    else
      erb :"user/signup"
    end
  end

  post '/signup' do
    if params[:email] != "" && params[:username] != "" && params[:password] != ""
      if User.find_by(username: params[:username])
        flash[:warning] = "Username is taken, please enter a unique username."
        redirect "/user/signup"
      else
        @user = User.create(email: params[:email], username: params[:username], password: params[:password])
        session[:user_id] = @user.username
        redirect "/user/#{@user.id}"
      end
    else
      flash[:warning] = "All Fields Must Be Complete."
      redirect "/user/signup"
    end
  end

  get "/user/login" do
    if logged_in?
      @user = User.find_by(username: session[:username])
      redirect "/user/#{@user.id}"
    else
      erb :"user/login"
    end
  end

  post '/login' do
    if params[:username] != "" && params[:password] != ""
      @user = User.find_by(username: params[:username])
      if @user.authenticate(params[:password])
        session[:username] = @user.username
        redirect "/user/#{@user.id}"
      else
        redirect "/signup"
      end
    else
      redirect "/signup"
    end
  end

  get '/user/logout' do
    if logged_in?
      session.clear
      redirect "/"
    else
      redirect "/"
    end
  end

  get "/user/:id" do
    if logged_in?
      @user = User.find(params[:id])
      erb :"user/show"
    else
      redirect "/"
    end
  end


end
