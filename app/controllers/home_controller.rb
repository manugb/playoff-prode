class HomeController < ApplicationController
  def login
  end

  def check_user
    if user_signed_in?
      redirect_to :dashboard
    else
      redirect_to new_user_session_path
    end
  end

  def dashboard
    @user_points = User.all.map {|u| {name: u.name, points: u.points}}.sort {|x,y| y[:points] <=> x[:points] }
  end
end
