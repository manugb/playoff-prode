class AddMvpToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :mvp_id, :integer, null: true
  end
end
