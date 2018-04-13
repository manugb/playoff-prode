class Serie < ApplicationRecord
  include Current

  belongs_to :team_a, class_name: "Team", foreign_key: "team_a_id"
  belongs_to :team_b, class_name: "Team", foreign_key: "team_b_id"
  has_many :matches
  belongs_to :mvp, class_name: "Player", foreign_key: "mvp_id"
  belongs_to :winner_team, class_name: "Team", foreign_key: "winner_team_id"

  def name
    "#{team_a.name} vs #{team_b.name}"
  end

  def is_east
    team_a.conference == "east" && team_b.conference == "east"
  end

  def is_west
    team_a.conference == "west" && team_b.conference == "west"
  end

  def winner
    if (matches.count > 0)
      winner_by_matches
    else
      winner_team
    end
  end

  # old - rode 2017
  def winner_by_matches
    a_win_matches = matches.where(winner: team_a)
    b_win_matches = matches.where(winner: team_b)
    if (a_win_matches.count === 4)
      team_a
    elsif (b_win_matches.count === 4)
      team_b
    else
      nil
    end
  end

  def loser
    if winner
      if team_a == winner
        team_b
      else
        team_a
      end
    else
      nil
    end
  end

  def loser_win_matches
    if (matches.count > 0)
      matches.where(winner: loser).count
    else
      loser_win_games
    end
  end

  def teams
    [team_a, team_b]
  end

  def self.the_finals
    Serie.find_by(round: "the_finals")
  end

  def can_edit_stats?
    active
  end
end
