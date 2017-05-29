class Match < ApplicationRecord
  default_scope { order(game: :desc) }

  belongs_to :serie
  belongs_to :winner, class_name: "Team", optional: true
  belongs_to :most_points, class_name: "Player", optional: true
  belongs_to :most_assists, class_name: "Player", optional: true
  belongs_to :most_rebounds, class_name: "Player", optional: true

  def team_a
    serie.team_a
  end

  def team_b
    serie.team_b
  end

  def can_edit_stats?
    active
  end
end
