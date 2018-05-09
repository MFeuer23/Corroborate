class UserController < ApplicationController
  
  get "/user/signup" do
    if logged_in?
      @user = User.find_by(username: session[:user_id])
      redirect "/user/#{@user.id}"
    else
      erb :"user/signup"
    end
  end
  
  get "/user/login" do
    erb :"user/login"
  end
  
  get "/user/:id" do
    @user = User.find(params[:id])
    erb :"user/show"
  end
end