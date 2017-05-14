class User < ApplicationRecord
  has_many :stats
  has_one :mvp, class_name: "Player", foreign_key: "mvp_id"

  validates :name, uniqueness: true

  def points
    serie_points + match_points
  end

  def match_points
    stats.map(&:points).sum
  end

  def serie_points
    total = 0

    Serie.all.each do |serie|
      if serie.winner && stats.where(winner: serie.winner, match: serie.matches).count === 4
        total += 30
      end

      if serie.loser && stats.where(winner: serie.loser, match: serie.matches).count === serie.loser_win_matches
        total += 15
      end
    end

    total
  end
end
