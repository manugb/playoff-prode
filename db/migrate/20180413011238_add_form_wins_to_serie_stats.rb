class AddFormWinsToSerieStats < ActiveRecord::Migration[5.0]
  def change
    add_column :serie_stats, :team_a_wins, :integer, default: 0
    add_column :serie_stats, :team_b_wins, :integer, default: 0
  end
end
