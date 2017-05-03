class Serie < ApplicationRecord
  belongs_to :team_a, class_name: "Team", foreign_key: "team_a_id"
  belongs_to :team_b, class_name: "Team", foreign_key: "team_b_id"
  has_many :matches

  after_create :create_matches

  def name
    "#{team_a.name} vs #{team_b.name}"
  end

  def create_matches
    7.times do |time|
      Match.create!(serie: self, game: time+1)
    end
  end

  def is_east
    team_a.conference == "east" && team_b.conference == "east"
  end

  def is_west
    team_a.conference == "west" && team_b.conference == "west"
  end

  def winner
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
    matches.where(winner: loser).count
  end
end
