class Team < ApplicationRecord
  include Current

  has_many :players

  POINTS_MULTIPLIER = {
    warriors: 1.1,
    rockets: 1.1,
    bucks: 1.1,
    raptors: 1.1,
    blazers: 1.2,
    jazz: 1.2,
    sixiers: 1.2,
    celtics: 1.2,
    thunder: 1.2,
    magic: 1.4
  }

  def players_options
    players.map{|p| [p.name, p.id]}
  end

  def points_multiplier
    POINTS_MULTIPLIER[name.downcase.to_sym] || 1
  end
end
