class Stat < ApplicationRecord
  belongs_to :user
  belongs_to :match
  belongs_to :winner, class_name: "Team", optional: true
  belongs_to :most_points, class_name: "Player", optional: true
  belongs_to :most_assists, class_name: "Player", optional: true
  belongs_to :most_rebounds, class_name: "Player", optional: true

  def team_a
    match.team_a
  end
  def team_b
    match.team_b
  end
  def players_options
    match.players_options
  end
end
