class AddActiveToSeries < ActiveRecord::Migration[5.0]
  def change
    add_column :series, :active, :boolean, default: true
  end
end
