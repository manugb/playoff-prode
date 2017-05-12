class AddTypeToSeries < ActiveRecord::Migration[5.0]
  def change
    add_column :series, :round, :string, default: "semis"
  end
end
