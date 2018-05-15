require 'rack-flash'

class ClaimController < ApplicationController

  use Rack::Flash
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end
  
  get "/claims/new_claim" do
    if logged_in?
      erb :"claims/new_claim"
    else
      redirect "/"
    end
  end

  post "/claims" do
    if logged_in?
      if params[:agree] == "yes" && params[:subject][:name] != "" && params[:claim][:location] != "" && params[:claim][:content] !="" && params[:user][:content] != ""
        @user = current_user
        @subject = Subject.find_or_create_by(params[:subject])
        @claim = Claim.create(params[:claim])
        @subject.claims << @claim
        @subject.save
        if params[:user][:contact] == "yes"
          @claim.contact = @user.email
          @claim.save
        else
          @claim.contact = "no contact provided"
          @claim.save
        end
        redirect "/subjects/#{@subject.slug}"
      else
          flash[:warning] = "All Fields Must Be Complete."
          redirect "/claims/new_claim"
      end
    else
      redirect "/"
    end
  end
end
