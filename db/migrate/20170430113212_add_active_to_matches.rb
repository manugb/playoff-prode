class AddActiveToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :active, :boolean, default: true
  end
end
