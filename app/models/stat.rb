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
    [
      [team_a.name, team_a.players_options],
      [team_b.name, team_b.players_options]
    ]
  end

  def serie
    match.serie
  end

  def points
    total = 0
    if match.winner && match.most_points && match.most_assists && match.most_rebounds
      if winner == match.winner
        total += 5
      end
      if most_points == match.most_points
        total += 3
      end
      if most_assists == match.most_assists
        total += 1
      end
      if most_rebounds == match.most_rebounds
        total += 1
      end
      if winner == match.winner && most_points == match.most_points && most_assists == match.most_assists && most_rebounds == match.most_rebounds
        total += 2
      end
    end
    total
  end
end
