class AddReferencesToStats < ActiveRecord::Migration[5.0]
  def change
    add_column :stats, :user_id, :integer
    add_column :stats, :match_id, :integer
    add_column :stats, :winner_id, :integer, null: true
    add_column :stats, :most_points_id, :integer, null: true
    add_column :stats, :most_assists_id, :integer, null: true
    add_column :stats, :most_rebounds_id, :integer, null: true
  end
end
