class AddReferencesToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :winner_id, :integer, null: true
    add_column :matches, :most_points_id, :integer, null: true
    add_column :matches, :most_assists_id, :integer, null: true
    add_column :matches, :most_rebounds_id, :integer, null: true
  end
end
