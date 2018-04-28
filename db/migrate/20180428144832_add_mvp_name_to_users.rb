class AddMvpNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :mvp_name, :string, null: true
  end
end
