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
    @east_series = Serie.all.select(&:is_east)
    @west_series = Serie.all.select(&:is_west)
  end

  def points
    @user_points = User.all.map {|u| {name: u.name, points: u.points}}
  end
end
