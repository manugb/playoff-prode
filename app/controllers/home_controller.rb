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

    quarters = Serie.where(round: "quarter").order(:created_at)
    semis = Serie.where(round: "semis").order(:created_at)

    @west_quarters = quarters.select(&:is_west)
    @east_quarters = quarters.select(&:is_east)

    @west_semis = semis.select(&:is_west)
    @east_semis = semis.select(&:is_east)
  end

  def fix_serie_stats_winner
    SerieStat.all.each do |ss|
      winner = ss.team_a if ss.team_a_wins == 4
      winner = ss.team_b if ss.team_b_wins == 4
      loser_win_games = ss.team_a_wins if ss.team_a_wins < 4
      loser_win_games = ss.team_b_wins if ss.team_b_wins < 4

      ss.update!(winner: winner, loser_win_games: loser_win_games)
    end
  end
end
