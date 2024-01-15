class CreateTrains < ActiveRecord::Migration[7.1]
  def change
    create_table :trains do |t|
      t.string :name
      t.float :cost, default: 0
      t.integer :status, default: 0
      t.float :weight_capacity, default: 0.0
      t.float :volume_capacity, default: 0.0
      t.datetime :departure_time
      t.references :operator, null: false, foreign_key: { to_table: :accounts }

      t.timestamps
    end
  end
end
