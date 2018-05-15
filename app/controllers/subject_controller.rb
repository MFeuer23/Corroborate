class SubjectController < ApplicationController

  get "/subjects/search" do
    erb :"/subjects/search_subjects"
  end
  
  
  
  get "/subjects/:slug" do
    @subject = Subject.find_by_slug(params[:slug])
    erb :"/subjects/show"
  end
end
