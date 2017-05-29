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
    @the_finals = Serie.the_finals
  end

  def finals
    final_series = Serie.where(round: "conference_finals")
    @east_serie = final_series.select(&:is_east).first
    @west_serie = final_series.select(&:is_west).first
  end

  def semis
    semis_series = Serie.where(round: "semis")
    @east_series = semis_series.select(&:is_east)
    @west_series = semis_series.select(&:is_west)
  end

  def points
    @user_points = User.all.map {|u| {name: u.name, points: u.points}}.sort {|x,y| y[:points] <=> x[:points] }
  end
end
