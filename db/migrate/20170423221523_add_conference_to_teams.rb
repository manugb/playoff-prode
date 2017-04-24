class AddConferenceToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :conference, :string
  end
end
