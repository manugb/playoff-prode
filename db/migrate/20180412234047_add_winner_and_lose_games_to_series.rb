class AddWinnerAndLoseGamesToSeries < ActiveRecord::Migration[5.0]
  def change
    add_column :series, :winner_team_id, :integer, null: true
    add_column :series, :loser_win_games, :integer, default: 0
  end
end
