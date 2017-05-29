class AddMvpToSeries < ActiveRecord::Migration[5.0]
  def change
    add_column :series, :mvp_id, :integer, null: true
  end
end
