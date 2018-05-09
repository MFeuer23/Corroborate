class UserController < ApplicationController
  
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
      @user = User.create(email: params[:email], username: params[:username], password: params[:password])
      session[:user_id] = @user.username
      redirect "/user/#{@user.id}"
    else
      redirect "/signup"
    end
  end
  
  get "/user/login" do
    if logged_in?
      @user = User.find_by(username: session[:user_id])
      redirect "/user/#{@user.id}"
    else
      erb :"user/login"
    end
  end
  
  post '/login' do
    if params[:username] != "" && params[:password] != ""
      @user = User.find_by(username: params[:username])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.username
        redirect "/user/#{@user.id}"
      else 
        redirect "/signup"
      end
    else
      redirect "/signup"
    end
  end
  
  get "/user/:id" do
    @user = User.find(params[:id])
    erb :"user/show"
  end
  
  get '/logout' do
    if logged_in?
      session.clear
      redirect "/"
    else
      redirect "/"
    end
  end
  
end