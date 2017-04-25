class Serie < ApplicationRecord
  belongs_to :team_a, class_name: "Team", foreign_key: "team_a_id"
  belongs_to :team_b, class_name: "Team", foreign_key: "team_b_id"
  has_many :matches

  def is_east
    team_a.conference == "east" && team_b.conference == "east"
  end

  def is_west
    team_a.conference == "west" && team_b.conference == "west"
  end
end
