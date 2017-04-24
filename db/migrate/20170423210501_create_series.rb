class CreateSeries < ActiveRecord::Migration[5.0]
  def change
    create_table :series do |t|

      t.timestamps
    end
  end
end
