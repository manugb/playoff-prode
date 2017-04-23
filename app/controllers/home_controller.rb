class HomeController < ApplicationController
  def login
  end

  def check_user
    if helpers.current_user
      redirect_to :dashboard
    else
      redirect_to :login
    end
  end

  def dashboard
  end
end
