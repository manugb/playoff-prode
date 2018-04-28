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
    puts serie.winner_team
    puts serie.winner_team
    puts winner
    puts winner

    puts serie.loser_win_games
    puts serie.loser_win_games
    puts loser_win_games
    puts loser_win_games
    if serie.winner_team && winner
      if winner.id == serie.winner_team_id
        total += 10
      end
      if loser_win_games == serie.loser_win_games
        total += 5
      end
    end
    total
  end
end
