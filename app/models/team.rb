class Team < ApplicationRecord
  has_many :players

  def players_options
    players.map{|p| [p.name, p.id]}
  end
end
