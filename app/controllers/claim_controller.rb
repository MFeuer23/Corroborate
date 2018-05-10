class ClaimController < ApplicationController
  
  get "/claims/new_claim" do
    if logged_in?
      erb :"claims/new_claim"
    else
      redirect "/"
    end
  end
end