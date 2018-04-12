class Player < ApplicationRecord
  include Current

  belongs_to :team

  def self.mvps_options
    final_series = Serie.where(round: "conference_finals")
    final_teams = final_series.map(&:teams).flatten
    final_teams.map {|team| [team.name, team.players_options]}
  end
end
