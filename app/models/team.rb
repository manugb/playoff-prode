class Team < ApplicationRecord
  include Current

  has_many :players

  def players_options
    players.map{|p| [p.name, p.id]}
  end
end
