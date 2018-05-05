class SerieStat < ApplicationRecord
  include Current

  belongs_to :user
  belongs_to :serie
  belongs_to :winner, class_name: "Team", optional: true

  def team_a
    serie.team_a
  end

  def team_b
    serie.team_b
  end

  def points
    total = 0
    if serie.winner_team && winner
      if winner == serie.winner_team
        total += serie.winner_points
      end
      if loser_win_games == serie.loser_win_games
        total += serie.loser_wins_points
      end
      if serie.winner_team == user.team
        total *= user.team.points_multiplier
      end
    end

    total
  end
end
