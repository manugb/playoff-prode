class AddGameToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :game, :integer, null: false, default: 1
  end
end
