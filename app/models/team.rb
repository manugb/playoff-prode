class Team < ApplicationRecord
  include Current

  has_many :players

  POINTS_MULTIPLIER = {
    warriors: 1.1,
    cavaliers: 1.1,
    rockets: 1.1,
    raptors: 1.2,
    blazers: 1.2,
    jazz: 1.3,
    sixiers: 1.3
  }

  def players_options
    players.map{|p| [p.name, p.id]}
  end

  def points_multiplier
    POINTS_MULTIPLIER[name.downcase.to_sym]
  end
end
