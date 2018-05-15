class ClaimController < ApplicationController

  get "/claims/new_claim" do
    if logged_in?
      erb :"claims/new_claim"
    else
      redirect "/"
    end
  end

  post "/claims" do
    if logged_in?
      @user = current_user
      @subject = Subject.find_or_create_by_name(params[:subject])
      @claim = Claim.create(params[:claim])
      @subject.claims << @claim
      @subject.save
      redirect "/subjects/#{@subject.slug}"
    else
      redirect "/"
    end
  end
end
