class SearchController < ApplicationController
  def index
    if current_user.role == "A Job"
      @search_box = User.where( role: "Employees" )
    else
      @search_box = User.where( role: "A Job" )
    end
  end
end
