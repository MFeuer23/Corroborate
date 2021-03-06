class SubjectController < ApplicationController

  get "/subjects/search" do
    if logged_in?
      @user = current_user
      erb :"/subjects/search_subjects"
    else
      redirect "/"
    end
  end

  post "/subjects/search" do
    if logged_in?
      @user = current_user
      if Subject.find_by(name: params[:name].titleize)
        @subject = Subject.find_by(name: params[:name].titleize)
        erb :"/subjects/show"
      else
        erb :"/subjects/not_found"
      end
    else
      redirect "/"
    end
  end

  get "/subjects/:slug" do
    if logged_in?
      @user = current_user
      @subject = Subject.find_by_slug(params[:slug])
      erb :"/subjects/show"
    else
      redirect "/"
    end
  end
end
