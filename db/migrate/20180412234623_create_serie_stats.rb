class CreateSerieStats < ActiveRecord::Migration[5.0]
  def change
    create_table :serie_stats do |t|
      t.references :user, foreign_key: true
      t.references :serie, foreign_key: true
      t.integer :winner_id, null: true
      t.integer :loser_win_games, default: 0

      t.timestamps
    end
  end
end
