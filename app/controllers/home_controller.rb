class HomeController < ApplicationController
  def index
    if logged_in?
    else
      @user = User.new
    end
  end

end
