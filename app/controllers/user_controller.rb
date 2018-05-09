class UserController < ApplicationController
  
  get "/user/signup" do
    erb :"user/signup"
  end
  
  get "/user/login" do
    erb :"user/login"
  end
  
  get "/user/:id" do
    @user = User.find(params[:id])
    erb :"user/index"
  end
end