class AddTeamsToSeries < ActiveRecord::Migration[5.0]
  def change
    add_column :series, :team_a_id, :integer
    add_column :series, :team_b_id, :integer
  end
end
