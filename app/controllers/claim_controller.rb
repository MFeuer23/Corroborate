require 'rack-flash'

class ClaimController < ApplicationController

  use Rack::Flash


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
        @user.claims << @claim
        @user.save
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

  get "/claims" do

    if logged_in?
      @user = current_user
      erb :"claims/claims"
    else
      redirect "/"
    end
  end

  get "/claims/:id" do
    if logged_in?

      @user = current_user
      @claim = Claim.find(params[:id])
      if @user.claims.include?(@claim)
        erb :"claims/show"
      else
        redirect "/claims"
      end
    else
      redirect "/"
    end
  end

  get "/claims/:id/edit" do
    if logged_in?
      @user = current_user
      @claim = Claim.find(params[:id])
      if @user.claims.include?(@claim)
        erb :"/claims/edit_claim"
      else
        redirect "/user/:id"
      end
    else
      redirect '/'
    end
  end

  post "/claims/:id" do
    if logged_in?
      @user = current_user
      @claim = Claim.find(params[:id])
      if params[:agree] == "yes" && params[:subject][:name] != "" && params[:claim][:location] != "" && params[:claim][:content] !="" && params[:user][:content] != ""
        @subject = Subject.find_or_create_by(name: params[:subject][:name])
        @claim.subject = @subject
        @claim.location = params[:claim][:location]
        @claim.content = params[:claim][:content]
        @claim.save
        if params[:user][:contact] == "yes"
          @claim.contact = @user.email
          @claim.save
        else
          @claim.contact = "no contact provided"
          @claim.save
        end
        redirect "/claims/#{@claim.id}"
      else
          flash[:warning] = "All Fields Must Be Complete."
          redirect "/claims/#{@claim.id}/edit"
      end
    else
      redirect "/"
    end
  end

  get "/claims/:id/delete" do
    if logged_in?
      @user = current_user
      @claim = Claim.find(params[:id])
      if @user.claims.include?(@claim)
        @claim.delete
        redirect "/claims"
      else
        redirect "/claims/#{@claim.id}"
      end
    else
      redirect "/"
    end
  end

end
